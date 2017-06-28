From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 28 Jun 2017 11:48:54 +0300
Subject: ucontect vs. ucontext_t (was Re: [RFC 4/6] ARC: Initial port to glibc)
In-Reply-To: <alpine.DEB.2.20.1706271147470.17677@digraph.polyomino.org.uk>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
 <1498550454-3560-5-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.20.1706271147470.17677@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <aeb31ac8-636a-69d7-b630-3fcd29c37ecc@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 06/27/2017 02:56 PM, Joseph Myers wrote:
>> +/* Userlevel context.  */
>> +typedef struct ucontext
>> +  {
>> +    unsigned long uc_flags;
>> +    struct ucontext *uc_link;
> This is now struct ucontext_t.

Isn't this an ABI change. After making change as you suggested, building 
gcc/libgcc itself fails now as the ARC libgcc unwinder expects ucontext.

	#define MD_FALLBACK_FRAME_STATE_FOR arc_fallback_frame_state

	static __attribute__((noinline)) _Unwind_Reason_Code
	arc_fallback_frame_state (struct _Unwind_Context *context,
				   _Unwind_FrameState *fs)
	{
	  struct rt_sigframe {
	    siginfo_t info;
	    struct ucontext uc;
	    unsigned int sigret_magic;
	  };

Can we atleast define a preprocessor macro to indicate this ABI change so 
downstream projects can support both things in short term ?

I see other threads on mailing list about distros being notifed etc of this ...

-Vineet
