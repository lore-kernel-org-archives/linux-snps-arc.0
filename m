From: otavio.salvador@ossystems.com.br (Otavio Salvador)
Date: Tue, 27 Nov 2018 17:30:43 -0200
Subject: [OE-core] [PATCH] u-boot-tools: Improve build preparation
In-Reply-To: <20181127191255.39052-1-abrodkin@synopsys.com>
References: <20181127191255.39052-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAP9ODKq2NRaMcW3nY-cs-uBuKBG3xx7sAuzBoZtRheo-jz+7CQ@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Tue, Nov 27, 2018 at 5:13 PM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
> Even though we're not going to build here real U-Boot binary
> it is still required to "configure" U-Boot to get get to the
> tools building.
>
> We used to use "sandbox_defconfig" for that purpose but
> since U-Boot v2018.11 it started to cause problems [1] due to [2].
>
> So to have less dependencies let's create super minimalistic
> configuration which is good enough to allow us to run "make tools".
>
> [1] http://errors.yoctoproject.org/Errors/Details/202185/
> [2] http://git.denx.de/?p=u-boot.git;a=commitdiff;h=a4958a71017fb142542f977c843c5fce769fc6ea
>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>

To allow extended use, we need to enable CONFIG_FIT_SIGNATURE
otherwise we won't have the support.

See:

# MXSImage needs LibSSL
ifneq ($(CONFIG_MX23)$(CONFIG_MX28)$(CONFIG_ARMADA_38X)$(CONFIG_ARMADA_39X)$(CONFIG_FIT_SIGNATURE),)
HOSTLOADLIBES_mkimage += \
        $(shell pkg-config --libs libssl libcrypto 2> /dev/null ||
echo "-lssl -lcrypto")

If you do that, we can likely rely on this and avoid some extra tools
packages (for example on meta-freescale).

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
