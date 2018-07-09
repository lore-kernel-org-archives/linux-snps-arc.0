From: David.Laight@ACULAB.COM (David Laight)
Date: Mon, 9 Jul 2018 13:30:43 +0000
Subject: [PATCH] atomic{64}_t: Explicitly specify data storage length and
 alignment
In-Reply-To: <20180709124741.21037-1-abrodkin@synopsys.com>
References: <20180709124741.21037-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3d3ec70d99524a6fa7a38e7d2e0fdf98@AcuMS.aculab.com>
To: linux-snps-arc@lists.infradead.org

From: Alexey Brodkin
> Sent: 09 July 2018 13:48
> Atomic instructions require data they operate on to be aligned
> according to data size. I.e. 32-bit atomic values must be 32-bit
> aligned while 64-bit values must be 64-bit aligned.
> 
> Otherwise even if CPU may handle not-aligend normal data access,
> still atomic instructions fail and typically raise an exception
> leaving us dead in the water.
...
> diff --git a/include/asm-generic/atomic64.h b/include/asm-generic/atomic64.h
> index 8d28eb010d0d..b94b749b5952 100644
> --- a/include/asm-generic/atomic64.h
> +++ b/include/asm-generic/atomic64.h
> @@ -13,7 +13,7 @@
>  #define _ASM_GENERIC_ATOMIC64_H
> 
>  typedef struct {
> -	long long counter;
> +	u64 __aligned(8) counter;
>  } atomic64_t;

Apart from the fact that this changes the value from signed to unsigned
should most of the architectures be using this generic definition?

The only exceptions would be 32bit architectures that lack 64bit
instructions (eg m68k).

	David
