From: colin.king@canonical.com (Colin Ian King)
Date: Mon, 24 Oct 2016 16:58:43 +0100
Subject: [PATCH] ARC: return -EFAULT on failed access_ok for
 arc_usr_cmpxchg syscall
In-Reply-To: <92d0dd5e-8aa8-3e55-193f-1fa440cb3ff3@synopsys.com>
References: <20161024104714.10047-1-colin.king@canonical.com>
 <92d0dd5e-8aa8-3e55-193f-1fa440cb3ff3@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <e4a1b8f6-8e21-eef3-fcf9-394cfa1d3216@canonical.com>
To: linux-snps-arc@lists.infradead.org

On 24/10/16 16:56, Vineet Gupta wrote:
> On 10/24/2016 03:47 AM, Colin King wrote:
>> From: Colin Ian King <colin.king at canonical.com>
>>
>> arc_usr_cmpxchg currently returns an uninitialized value in ret
>> on a failed access_ok call. Instead, return -EFAULT.
>>
>> Signed-off-by: Colin Ian King <colin.king at canonical.com>
>> ---
>>  arch/arc/kernel/process.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arc/kernel/process.c b/arch/arc/kernel/process.c
>> index a746008..9ae3e1c 100644
>> --- a/arch/arc/kernel/process.c
>> +++ b/arch/arc/kernel/process.c
>> @@ -47,7 +47,7 @@ SYSCALL_DEFINE3(arc_usr_cmpxchg, int *, uaddr, int, expected, int, new)
>>  	int ret;
>>  
>>  	if (!access_ok(VERIFY_WRITE, uaddr, sizeof(int)))
>> -		return ret;
>> +		return -EFAULT;
>>  
>>  	preempt_disable();
> 
> Thx for spotting this. Since this is new code, not yet merged, do you mind if I
> squash it with orig patch. I can add a Reviewed-by a SOB as you prefer.

Sure, squash it int and add me as a Reviewed-by.

Colin
> 
> Thx,
> -Vineet
> 
> 
