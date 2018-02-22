From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 22 Feb 2018 09:38:32 -0800
Subject: [PATCH v2] mmc: dw_mmc: Fix the DTO timeout overflow calculation
 for 32-bit systems
In-Reply-To: <bec45955-1e84-400b-961f-35b5342c671f@rock-chips.com>
References: <20180222133418.29336-1-Evgeniy.Didin@synopsys.com>
 <bec45955-1e84-400b-961f-35b5342c671f@rock-chips.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <afbfa58b-500e-4d65-04a5-f5f26d8e6abe@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 02/22/2018 07:28 AM, Shawn Lin wrote:
>>
>> Lets cast this multiply to u64 type which prevents overflow.
>>
>> Tested-by: Vineet Gupta <Vineet.Gupta1 at synopsys.com>
>> Fixes: ARC STAR 9001306872 HSDK, sdio: board crashes when copying big files
>>
>> Signed-off-by: Evgeniy Didin <Evgeniy.Didin at synopsys.com>
>>
>> CC: Alexey Brodkin <abrodkin at synopsys.com>
>> CC: Eugeniy Paltsev <paltsev at synopsys.com>
>> CC: Douglas Anderson <dianders at chromium.org>
>> CC: Ulf Hansson <ulf.hansson at linaro.org>
>> CC: linux-kernel at vger.kernel.org
>> CC: linux-snps-arc at lists.infradead.org
>> Cc: <stable at vger.kernel.org> #? 9d9491a7da2a mmc: dw_mmc: Fix the DTO timeout 
>> calculation
> 
> The fix looks good to me, but the tags should be improved a bit:
> 
> Fixes: 9d9491a7da2a ("mmc: dw_mmc: Fix the DTO timeout calculation")

Ok, then perhaps use Reported-by tag to call out when/how issue was found.

Reported-by: ARC STAR 9001306872 HSDK, sdio: board crashes when copying big files

> Cc: <stable at vger.kernel.org>
> 
> Otherwise,
> Reviewed-by: Shawn Lin <shawn.lin at rock-chips.com>
