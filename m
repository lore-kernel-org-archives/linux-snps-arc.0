From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 8 Aug 2016 09:28:27 -0700
Subject: Build regressions/improvements in v4.8-rc1
In-Reply-To: <CAMuHMdW_fPP5dyOtRC98gh1kG-zuW_KxV7vAME_7b8Z-U10N_g@mail.gmail.com>
References: <alpine.DEB.2.10.1608081032130.9359@ayla.of.borg>
 <CAMuHMdW_fPP5dyOtRC98gh1kG-zuW_KxV7vAME_7b8Z-U10N_g@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <89010fe1-8f08-0cd9-a23e-455e5288f136@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Geert,

On 08/08/2016 01:38 AM, Geert Uytterhoeven wrote:
>>   + {standard input}: Error: Instruction with long immediate data in delay slot:  => 18728
> arcv2/axs103_smp_defconfig

What build service/farm does this use. Recently Guenter ran into this too and
updated his toolchain to work around the gcc bug.

-Vineet
