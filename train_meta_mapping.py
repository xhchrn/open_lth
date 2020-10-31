import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim
from torch.nn.modules import padding
from torch.tensor import Tensor

from tqdm import tqdm
from torch.utils.data import TensorDataset, DataLoader

from torch.utils.tensorboard import SummaryWriter
writer = SummaryWriter('/datadrive_c/xiaohan/open_lth_data/runs')


class MetaMap(nn.Module):

    def __init__(self):
        super(MetaMap, self).__init__()
        self.conv1 = nn.Conv2d(32, 64, kernel_size=3, padding=1, bias=False)
        self.conv2 = nn.Conv2d(64, 64, kernel_size=3, padding=1, bias=False)
        self.conv3 = nn.Conv2d(64, 32, kernel_size=3, padding=1, bias=False)
        self.conv4 = nn.Conv2d(32, 16, kernel_size=3, padding=1, bias=False)

    def forward(self, x):
        x = self.conv1(x)
        x = F.leaky_relu(x, negative_slope=0.1)

        x = self.conv2(x)
        x = F.leaky_relu(x, negative_slope=0.1)

        x = self.conv3(x)
        x = F.leaky_relu(x, negative_slope=0.1)

        x = self.conv4(x)
        # x = F.leaky_relu(x, negative_slope=0.1)

        return F.sigmoid(x)


if __name__ == "__main__":
    train_path = '/datadrive_c/xiaohan/open_lth_data/train_wd_m.pt'
    val_path = '/datadrive_c/xiaohan/open_lth_data/val_wd_m.pt'
    train_t = torch.load(train_path)
    val_t = torch.load(val_path)
    train_dataset = TensorDataset(train_t['inputs'], train_t['labels'])
    val_dataset = TensorDataset(val_t['inputs'], val_t['labels'])
    train_dataloader = DataLoader(train_dataset, batch_size=128, shuffle=True)
    val_dataloader = DataLoader(val_dataset, batch_size=120, shuffle=True)

    meta = MetaMap().cuda()
    optimizer = optim.Adam(lr=0.01)

    for epoch in range(100):
        with tqdm(train_dataloader, dynamic_ncols=True) as t:
            train_loss = 0.0
            for batch_idx, (inputs, targets) in enumerate(t):
                inputs = inputs.cuda()
                targets = targets.cuda()

                outputs = meta(inputs)
                loss = F.mse_loss(outputs, target=targets)
                train_loss += loss.item()

                loss.backward()
                optimizer.step()

                t.set_postfix(loss=train_loss/(batch_idx+1))  #, acc=100.*correct/total, correct=correct, total=total)
            writer.add_scalar('train_loss', train_loss/len(train_dataloader), global_step=epoch)

        with torch.no_grad():
            val_loss = 0.0
            for inputs, targets in val_dataloader:
                inputs = inputs.cuda()
                targets = targets.cuda()

                outputs = meta(inputs)
                loss = F.mse_loss(outputs, target=targets)
                val_loss += loss.item()
            print('Validation Loss: {}'.format(val_loss/len(val_dataloader)))
            writer.add_scalar('val_loss', val_loss/len(val_dataloader), global_step=epoch)

        torch.save(meta.state_dict(), '/datadrive_c/xiaohan/open_lth_data/meta_ckpt.pt')
