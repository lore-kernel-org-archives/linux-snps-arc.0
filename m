From: lkp@intel.com (kbuild test robot)
Date: Sun, 3 Apr 2016 13:05:09 +0800
Subject: [PATCH 1/3 v2] drm/i2c/adv7511: Add audio support
In-Reply-To: <15b1936d307912ba12df7fa09ec3a7a80ac5fcef.1459174494.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201604031328.ss7HU7jS%fengguang.wu@intel.com>
To: linux-snps-arc@lists.infradead.org

Hi Jose,

[auto build test ERROR on drm/drm-next]
[also build test ERROR on v4.6-rc1 next-20160401]
[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]

url:    https://github.com/0day-ci/linux/commits/Jose-Abreu/Add-I2S-ADV7511-audio-support-for-ARC-AXS10x-boards/20160328-224040
base:   git://people.freedesktop.org/~airlied/linux.git drm-next
config: x86_64-randconfig-s5-04031201 (attached as .config)
reproduce:
        # save the attached .config to linux build tree
        make ARCH=x86_64 

All errors (new ones prefixed by >>):

   drivers/built-in.o: In function `adv7511_audio_init':
>> (.text+0x1c608b): undefined reference to `snd_soc_register_codec'
   drivers/built-in.o: In function `adv7511_audio_exit':
>> (.text+0x1c6096): undefined reference to `snd_soc_unregister_codec'

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/octet-stream
Size: 23536 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20160403/90c8d73c/attachment-0001.obj>
