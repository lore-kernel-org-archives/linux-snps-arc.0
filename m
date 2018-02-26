From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 26 Feb 2018 13:01:45 -0800
Subject: uClibc-ng testsuite failures
In-Reply-To: <20180226205038.GV12535@waldemar-brodkorb.de>
References: <20180226005009.GR12535@waldemar-brodkorb.de>
 <1519647108.3740.8.camel@synopsys.com>
 <20180226195907.GU12535@waldemar-brodkorb.de>
 <4aa73094-21c0-99a4-6d00-76d8c63c16c7@synopsys.com>
 <20180226205038.GV12535@waldemar-brodkorb.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <78495eac-88d0-b4cd-1e80-2104f719e923@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 02/26/2018 12:50 PM, Waldemar Brodkorb wrote:
> Hi Vineet,
> Vineet Gupta wrote,
>
>> On 02/26/2018 11:59 AM, Waldemar Brodkorb wrote:
>>>>> The syscall cancellation failures are still there with gcc 7.3.0 and
>>>>> binutils 2.30. Do you have any patches on top of it?
>>>> Are you talking about these results?
>>>> https://urldefense.proofpoint.com/v2/url?u=https-3A__downloads.uclibc-2Dng.org_reports_1.0.28_REPORT.arcv2.libc.uClibc-2Dng-2D1.0.28&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=7FgpX6o3vAhwMrMhLh-4ZJey5kjdNUwOL2CWsFwR4T8&m=TsxZS2Izf4LUrQfQCh9Iw8-L0zYXeJLdRhvUfyiWw2A&s=BGT84AxTG_-ymRw4CytOO7g6kTy7PXKYBrHbGF_pTR4&e=
>>> No.
>>>> But the link above points to stuff built with gcc 7.2 but not 7.3.
>>>> Could you please share your results with gcc 7.2 and binutils 2.30?
>>> Here with gcc 7.3.0 and binutils 2.30:
>>> https://urldefense.proofpoint.com/v2/url?u=https-3A__downloads.uclibc-2Dng.org_reports_git_&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=7FgpX6o3vAhwMrMhLh-4ZJey5kjdNUwOL2CWsFwR4T8&m=TsxZS2Izf4LUrQfQCh9Iw8-L0zYXeJLdRhvUfyiWw2A&s=Ni7_rqZq4c0mvnYsOyvZoZEIddMnIOEsSmopG9m9LwU&e=
>> I ran into similar issues with glibc test suite. It seems gcc 7.x released
>> won't cut it - it misses tons of upstream patches including
>>
>> 2017-11-03 e892f4fac605 [ARC] Fix to unwinding.
>>
>> So your best bet is to use upstream gcc master !
> gcc 7 branch or gcc 8 latest greatest?

AFAIK gcc 8 is not released yet, so upstream/master !

> Last time there was some issue with gcc8 and you told me to use gcc7
> with some patches.

Right there was yet another code gen issue / ICE at the time, which is likely gone 
now. But gcc upstream/master works for me.

> /me is confused.

Sorry if I steered you the wrong way. At that time upstream was practically not 
usable, so more unwinder tests failing were kind of secondary on priority ;-)

-Vineet
