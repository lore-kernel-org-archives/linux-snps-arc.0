From: will.deacon@arm.com (Will Deacon)
Date: Mon, 9 Jul 2018 14:07:39 +0100
Subject: [PATCH] atomic{64}_t: Explicitly specify data storage length and
 alignment
In-Reply-To: <20180709124741.21037-1-abrodkin@synopsys.com>
References: <20180709124741.21037-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180709130738.GA28336@arm.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Jul 09, 2018@03:47:41PM +0300, Alexey Brodkin wrote:
> Atomic instructions require data they operate on to be aligned
> according to data size. I.e. 32-bit atomic values must be 32-bit
> aligned while 64-bit values must be 64-bit aligned.
> 
> Otherwise even if CPU may handle not-aligend normal data access,
> still atomic instructions fail and typically raise an exception
> leaving us dead in the water.
> 
> This came-up during lengthly discussion here:
> http://lists.infradead.org/pipermail/linux-snps-arc/2018-July/004022.html
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Will Deacon <will.deacon at arm.com>
> Cc: Peter Zijlstra <peterz at infradead.org>
> Cc: Boqun Feng <boqun.feng at gmail.com>
> Cc: Russell King <linux at armlinux.org.uk>
> Cc: Arnd Bergmann <arnd at arndb.de>
> Cc: Thomas Gleixner <tglx at linutronix.de>
> Cc: Ingo Molnar <mingo at redhat.com>
> Cc: Darren Hart <dvhart at infradead.org>
> Cc: Shuah Khan <shuah at kernel.org>
> Cc: "Paul E. McKenney" <paulmck at linux.vnet.ibm.com>
> Cc: Josh Triplett <josh at joshtriplett.org>
> Cc: Steven Rostedt <rostedt at goodmis.org>
> Cc: Mathieu Desnoyers <mathieu.desnoyers at efficios.com>
> Cc: Lai Jiangshan <jiangshanlai at gmail.com>
> Cc: David Laight <David.Laight at ACULAB.COM>
> Cc: Geert Uytterhoeven <geert at linux-m68k.org>
> Cc: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
> ---
>  arch/arm/include/asm/atomic.h                                 | 2 +-
>  include/asm-generic/atomic64.h                                | 2 +-
>  include/linux/types.h                                         | 4 ++--
>  tools/include/linux/types.h                                   | 2 +-
>  tools/testing/selftests/futex/include/atomic.h                | 2 +-
>  .../rcutorture/formal/srcu-cbmc/include/linux/types.h         | 4 ++--
>  6 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/include/asm/atomic.h b/arch/arm/include/asm/atomic.h
> index 66d0e215a773..2ed6d7cf1407 100644
> --- a/arch/arm/include/asm/atomic.h
> +++ b/arch/arm/include/asm/atomic.h
> @@ -267,7 +267,7 @@ ATOMIC_OPS(xor, ^=, eor)
>  
>  #ifndef CONFIG_GENERIC_ATOMIC64
>  typedef struct {
> -	long long counter;
> +	u64 __aligned(8) counter;
>  } atomic64_t;

Long long is 8-byte aligned per EABI ARM, and we use the generic atomic64
infrastructure for OABI, so we don't need to change anything here afaict.

Will
