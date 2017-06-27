From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 27 Jun 2017 19:52:38 +0300
Subject: [RFC 4/6] ARC: Initial port to glibc
In-Reply-To: <alpine.DEB.2.20.1706271553590.18823@digraph.polyomino.org.uk>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
 <1498550454-3560-5-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.20.1706271147470.17677@digraph.polyomino.org.uk>
 <0cd32bdd-5ec4-0fb6-8cf8-fd658596e790@synopsys.com>
 <alpine.DEB.2.20.1706271553590.18823@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <30d4364e-1932-649c-917e-d0bc2dc4093c@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 06/27/2017 06:55 PM, Joseph Myers wrote:
> On Tue, 27 Jun 2017, Vineet Gupta wrote:
> 
>>>> +typedef struct sigcontext mcontext_t;
>>>
>>> You can avoid this problematic definition for a new architecture, even
>>> while we're still discussing eliminating it for existing architectures.
>>
>> So just use struct sigcontext as data type for uc_mcontext ?
> 
> No.  Define mcontext_t to be a struct without a tag, with the same layout
> as struct sigcontext, as the identifier sigcontext (and non-reserved
> identifiers for its elements) are not in the POSIX namespace permitted for
> ucontext.h.
> 
> https://sourceware.org/ml/libc-alpha/2017-06/msg00946.html

thx for this link - per comments there the contents of struct sigcontext could 
come from kernel which is

   struct sigcontext {
	struct user_regs_struct regs;
   };

Now I'd rather prefer to not duplicate user_regs_struct here, but instead just 
refer to kernel variant, something like ...

   typedef struct user_regs_struct mcontext_t;

Will that work or do I absolutely need to redefine this in userspace hdrs ?

-Vineet
