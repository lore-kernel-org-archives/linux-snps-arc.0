From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 22 Jun 2017 11:06:14 -0700
Subject: uclibc test suite with gnu 2017.03 (was Re: [Fwd: Re: nsim latest
 free version])
In-Reply-To: <1498152714.13700.63.camel@synopsys.com>
References: <20170622144201.GN26922@waldemar-brodkorb.de>
 <1498152714.13700.63.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <90e5eb43-8912-cb2f-fe72-9b385398f232@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Waldemar,

>> Hi Waldemar,
>>
>> On Wed, 2017-06-21@21:16 +0200, Waldemar Brodkorb wrote:
>>> Hi Alexey,
>>>
>>> I have some issues lately running the testsuite in NSIM.
>>> Is there may be some new version available?
>>> How I can get an updated version?
>> Let me check with our nSIM devs.
>> But could you please elaborate a bit what is your problem?
> It stalls / deadlocks here:
> PASS tst-cancel23
> FAIL tst-cancel25 got 1 expected 0
>          Timed out: killed the child process
> PASS tst-cancel3
> FAIL tst-cancel4 got 1 expected 0
>          Timed out: killed the child process
> .... tst-cancel5
>
> Seems to happen since the toolchain update to 2017.03
> (binutils/gcc). ARCv2 little endian started with the old script:
> https://urldefense.proofpoint.com/v2/url?u=https-3A__cgit.openadk.org_cgi_cgit_openadk.git_tree_scripts_nsim.sh&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lq
> deeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=8GRVuMbTElbNMAj_Fn7DTePw5-sVRsJ3lki2x-ofbzo&s=l2eNCzqvmvtPr63NgA0Uv-t7ze5J0eJeAq9ZcsDgu_Y&e=
>
> With attached uClibc-ng.config.

Can you please provide the full boot log  if possible - I could successfully run 
the "old" test suite with 2017.03 !

Also I presume there's no real evidence to attribute this is an nSIM issue - it 
could very well be a Linux kernel or tools issue.
Can you share your vmlinux which we can try on nsim here !

Thx,
-Vineet
