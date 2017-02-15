From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 14 Feb 2017 23:48:30 -0800
Subject: [PATCH] [ARC] Handle aux registers differences on ARC700 vs. HS38
 cpus
In-Reply-To: <c610d22c-54de-0d72-8f7f-73485f0e79f3@redhat.com>
References: <1486659402-6670-1-git-send-email-vgupta@synopsys.com>
 <c610d22c-54de-0d72-8f7f-73485f0e79f3@redhat.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <348f6123-5068-884d-3711-0bea73537d29@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Nick,

On 02/13/2017 03:38 AM, Nick Clifton wrote:
> Hi Vineet,
> 
>> opcodes/
>> 2017-02-09  Vineet Gupta <vgupta at synopsys.com>
>>
>> 	* arc-regs.h: Distinguish some of the registers different on
>> 	ARC700 and HS38 cpus.
>>
>> gas/
>> 2017-02-09  Vineet Gupta <vgupta at synopsys.com>
>>
>> 	* testsuite/gas/arc/st.d: Update for 0xe having a name now
>  
> Approved - please apply.
> 
> Cheers
>   Nick

I suppose you or Claudiu will have to do this since I obviously don't have repo
push access !

-Vineet
