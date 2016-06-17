From: linux@roeck-us.net (Guenter Roeck)
Date: Fri, 17 Jun 2016 07:52:37 -0700
Subject: Build failures in -next due to 'locking/atomic, arch/arc:
 Implement atomic_fetch_{add,sub,and,andnot,or,xor}()'
In-Reply-To: <20160617144136.GK30927@twins.programming.kicks-ass.net>
References: <57640B08.4090007@roeck-us.net>
 <20160617143942.GV30154@twins.programming.kicks-ass.net>
 <20160617144136.GK30927@twins.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <57640EB5.8090604@roeck-us.net>
To: linux-snps-arc@lists.infradead.org

On 06/17/2016 07:41 AM, Peter Zijlstra wrote:
> On Fri, Jun 17, 2016@04:39:42PM +0200, Peter Zijlstra wrote:
>> On Fri, Jun 17, 2016@07:36:56AM -0700, Guenter Roeck wrote:
>>> Hi Peter,
>>>
>>> I am seeing build failures in -next when trying to build arc / arcv2 targets.
>>>
>>> arch/arc/include/asm/atomic.h:74:2: error: ?SCOND_FAIL_RETRY_VAR_DEF? undeclared
>>> arch/arc/include/asm/atomic.h:87:2: error: expected ?:? or ?)? before ?SCOND_FAIL_RETRY_ASM?
>>>
>>> Problems seem to be caused by 'locking/atomic, arch/arc: Implement
>>> atomic_fetch_{add,sub,and,andnot,or,xor}()'. Both SCOND_FAIL_RETRY_VAR_DEF and
>>> SCOND_FAIL_RETRY_ASM are undefined.
>>
>> Crud, I messed up the rebase against the backoff reverts. Lemme go do
>> fixups.
>
> I've misplaced my arc compiler, but does this make it go again?
>
Looks like it, yes. Build still fails for another reason, but this problem is gone.
I can not do any runtime tests, though, only build tests.

Guenter

>
> ---
>   arch/arc/include/asm/atomic.h | 8 --------
>   1 file changed, 8 deletions(-)
>
> diff --git a/arch/arc/include/asm/atomic.h b/arch/arc/include/asm/atomic.h
> index bd9c51cb2bfd..4e3c1b6b0806 100644
> --- a/arch/arc/include/asm/atomic.h
> +++ b/arch/arc/include/asm/atomic.h
> @@ -71,7 +71,6 @@ static inline int atomic_##op##_return(int i, atomic_t *v)		\
>   static inline int atomic_fetch_##op(int i, atomic_t *v)			\
>   {									\
>   	unsigned int val, orig;						\
> -	SCOND_FAIL_RETRY_VAR_DEF                                        \
>   									\
>   	/*								\
>   	 * Explicit full memory barrier needed before/after as		\
> @@ -84,11 +83,8 @@ static inline int atomic_fetch_##op(int i, atomic_t *v)			\
>   	"	" #asm_op " %[val], %[orig], %[i]	\n"		\
>   	"	scond   %[val], [%[ctr]]		\n"		\
>   	"						\n"		\
> -	SCOND_FAIL_RETRY_ASM						\
> -									\
>   	: [val]	"=&r"	(val),						\
>   	  [orig] "=&r" (orig)						\
> -	  SCOND_FAIL_RETRY_VARS						\
>   	: [ctr]	"r"	(&v->counter),					\
>   	  [i]	"ir"	(i)						\
>   	: "cc");							\
> @@ -199,10 +195,6 @@ ATOMIC_OPS(andnot, &= ~, bic)
>   ATOMIC_OPS(or, |=, or)
>   ATOMIC_OPS(xor, ^=, xor)
>
> -#undef SCOND_FAIL_RETRY_VAR_DEF
> -#undef SCOND_FAIL_RETRY_ASM
> -#undef SCOND_FAIL_RETRY_VARS
> -
>   #else /* CONFIG_ARC_PLAT_EZNPS */
>
>   static inline int atomic_read(const atomic_t *v)
>
