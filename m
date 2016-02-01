From: linux.mdb@gmail.com (Jeff Merkey)
Date: Mon, 1 Feb 2016 09:04:33 -0700
Subject: [PATCH 11/31] Add debugger entry points for ARC
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F4E875A7@us01wembx1.internal.synopsys.com>
References: <1454010404-28845-1-git-send-email-jeffmerkey@gmail.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E875A7@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAO6TR8XCfoMkw4y0D11r-+NXRJR6e0Yg=rsQShdw=Qou-iwGaQ@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On 2/1/16, Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
> On Friday 29 January 2016 01:16 AM, Jeffrey Merkey wrote:
>> This patch series adds an export which can be set by system debuggers to
>> direct the hard lockup and soft lockup detector to trigger a breakpoint
>> exception and enter a debugger if one is active.  It is assumed that if
>> someone sets this variable, then an breakpoint handler of some sort will
>> be actively loaded or registered via the notify die handler chain.
>>
>> This addition is extremely useful for debugging hard and soft lockups
>> real time and quickly from a console debugger.
>>
>> Signed-off-by: Jeffrey Merkey <jeffmerkey at gmail.com>
>
> To reduce duplication, maybe later this could be used to replace
> arch_kgdb_breakpoint()
>
> Acked-by: Vineet Gupta <vgupta at synopsys.com>
>

You can drop this patch series, I am rethinking a better way to do this.

Jeff
