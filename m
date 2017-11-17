From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 17 Nov 2017 10:22:19 -0800
Subject: [PATCH] [ARC] update GLIBC_DYNAMIC_LINKER per glibc upstreaming
 review comments
In-Reply-To: <098ECE41A0A6114BB2A07F1EC238DE89667B8B97@de02wembxa.internal.synopsys.com>
References: <1510356167-8523-1-git-send-email-vgupta@synopsys.com>
 <098ECE41A0A6114BB2A07F1EC238DE89667B8B97@de02wembxa.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <771915e1-7088-58ba-f4a3-ff7f4184a613@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/17/2017 04:23 AM, Claudiu Zissulescu wrote:
> Hi,
>
>> gcc/
>> 	* config/arc/linux.h: GLIBC_DYNAMIC_LINKER update per glibc
>> 	upstreaming review comments
>>
> Accepted and committed. Thank you for your contribution,
> Claudiu

Hi,

Please also consider this for backporting as that is the gcc version in use by 
glibc test harnesses !

Thx,
-Vineet
