From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Nov 2016 15:15:32 -0700
Subject: [PATCH v2 02/10] ARC: timer: gfrc, rtc: deuglify big endian code
In-Reply-To: <20161103215509.GN1859@mai>
References: <1478208701-30923-1-git-send-email-vgupta@synopsys.com>
 <1478208701-30923-3-git-send-email-vgupta@synopsys.com>
 <20161103215509.GN1859@mai>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <bb8393b1-c529-d777-57c3-dfdd27e8fcc5@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/03/2016 02:55 PM, Daniel Lezcano wrote:
> On Thu, Nov 03, 2016@02:31:33PM -0700, Vineet Gupta wrote:
>> A standard "C" shift will be handled appropriately by the compiler
>> dependin gon the endian used fo rbuild. So we don't need the
> 
> s/dependin gon/depending on/
> s/fo rbuild/for build/

Sorry for fat fingering those. Fixed now.

> 
>> explicit distinction in code
>>
>> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
>> ---
> 
