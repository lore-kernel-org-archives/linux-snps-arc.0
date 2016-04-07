From: lkp@intel.com (kbuild test robot)
Date: Fri, 8 Apr 2016 01:54:52 +0800
Subject: [PATCH 4/5 v4] ASoC: dwc: Add custom PCM driver
In-Reply-To: <cd6b78074e054bf5991dd0800959ac4cf1076dc3.1460047238.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201604080100.XjcjGZqI%fengguang.wu@intel.com>
To: linux-snps-arc@lists.infradead.org

Hi Jose,

[auto build test ERROR on drm/drm-next]
[also build test ERROR on v4.6-rc2 next-20160407]
[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]

url:    https://github.com/0day-ci/linux/commits/Jose-Abreu/Add-I2S-ADV7511-audio-support-for-ARC-AXS10x-boards/20160408-005829
base:   git://people.freedesktop.org/~airlied/linux.git drm-next
config: i386-allmodconfig (attached as .config)
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

All errors (new ones prefixed by >>):

>> sound/soc/dwc/designware_pcm.c:46:5: error: redefinition of 'dw_pcm_transfer'
    int dw_pcm_transfer(u32 *lsample, u32 *rsample, int bytes, int buf_size,
        ^
   In file included from sound/soc/dwc/designware_pcm.c:20:0:
   sound/soc/dwc/designware.h:63:5: note: previous definition of 'dw_pcm_transfer' was here
    int dw_pcm_transfer(u32 *lsample, u32 *rsample, int bytes, int buf_size,
        ^

vim +/dw_pcm_transfer +46 sound/soc/dwc/designware_pcm.c

    40		.period_bytes_min = PERIOD_BYTES_MIN,
    41		.period_bytes_max = BUFFER_BYTES_MAX / PERIODS_MIN,
    42		.periods_min = PERIODS_MIN,
    43		.periods_max = BUFFER_BYTES_MAX / PERIOD_BYTES_MIN,
    44	};
    45	
  > 46	int dw_pcm_transfer(u32 *lsample, u32 *rsample, int bytes, int buf_size,
    47			struct dw_pcm_binfo *bi)
    48	{
    49		struct snd_pcm_runtime *rt = bi->stream->runtime;

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/octet-stream
Size: 54459 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20160408/fe14ec37/attachment-0001.obj>
