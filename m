From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 26 Nov 2018 21:30:18 +0000
Subject: [PATCH v7] u-boot: Add mkenvimage tool
In-Reply-To: <CAMKF1sqbHtV1UYiXre_1sNEzyFWJw3mRs_hcuVzu+us_r0OWVg@mail.gmail.com>
References: <20181122225820.2553-1-abrodkin@synopsys.com>
 <CAMKF1sqbHtV1UYiXre_1sNEzyFWJw3mRs_hcuVzu+us_r0OWVg@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <8950e9f58055a8667d20ff83de1f8acd14b7f303.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Khem,


On Sat, 2018-11-24@06:57 -0800, Khem Raj wrote:
> 
> http://errors.yoctoproject.org/Errors/Details/202185/

Looking at the target name "u-boot-tools-1_2018.11-r0 do_compile"
I think it might have something to do with bump of U-Boot to v2018.11
and the error message in question was added in v2018.11-rc1,
see http://git.denx.de/?p=u-boot.git;a=commitdiff;h=a4958a71017fb142542f977c843c5fce769fc6ea

The problem is we use "sandbox_defconfig" as a dummy defconfig
because otherwise (not configured) U-Boot's build-system won't
allow us to proceed and in its turn mentioned patch adds a check
for a target platform like "if defined(__x86_64__)" which
we essentially don't satisfy and so we fail.

There're the following solutions:
 1. Revert mentioned patch
 2. Disable "CONFIG_EFI_LOADER"

Reverting is not nice and not future-proof.
Disabling of "CONFIG_EFI_LOADER" might be done in a couple of ways
like:
 1. Patching sandbox_defconfig
 2. Filtering "CONFIG_EFI_LOADER" from "sandbox_defconfig" right before
    execution of "make sandbox_defconfig"

I think latter option is the simplest and cleanest.

Should I send a patch for that?

-Alexey
