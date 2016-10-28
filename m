From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 28 Oct 2016 14:52:07 -0700
Subject: [PATCH] lpfc: use %zd format string for size_t
In-Reply-To: <27a8ca4b-3259-17bd-acbf-ee809ec4f67b@synopsys.com>
References: <20161017123605.2217411-1-arnd@arndb.de>
 <26e675e3-af5b-eaf7-fea0-b4aff9767332@synopsys.com>
 <18294392.WY3416IpNg@wuerfel>
 <27a8ca4b-3259-17bd-acbf-ee809ec4f67b@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3374da57-ecd8-6376-5fca-0466fb799777@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 10/28/2016 02:44 PM, Vineet Gupta wrote:
> This is configuration specific, and something caused your compiler to
>> be built assuming that size_t is unsigned long, while the kernel
>> headers are assuming it should be unsigned int.

So yes this seems to be target specific gcc thing

for ARC 4.8

#define PTRDIFF_TYPE "int"

ARM

#ifndef PTRDIFF_TYPE
#define PTRDIFF_TYPE (TARGET_AAPCS_BASED ? "int" : "long int")
#endif

ARC gcc 6.2

#undef PTRDIFF_TYPE
#define PTRDIFF_TYPE "long int"
