From: ys114321@gmail.com (Y Song)
Date: Wed, 1 May 2019 23:31:25 -0700
Subject: [PATCH] tools/bpf: fix perf build error with uClibc (seen on ARC)
In-Reply-To: <1556751209-4778-1-git-send-email-vgupta@synopsys.com>
References: <1556751209-4778-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAH3MdRVkUFfwKkgT-pi-RLBpcEf6n0bAwWZOu-=7+qctPTCpkw@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Wed, May 1, 2019@3:55 PM Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
>
> When build perf for ARC recently, there was a build failure due to lack
> of __NR_bpf.
>
> | Auto-detecting system features:
> |
> | ...                     get_cpuid: [ OFF ]
> | ...                           bpf: [ on  ]
> |
> | #  error __NR_bpf not defined. libbpf does not support your arch.
>     ^~~~~
> | bpf.c: In function 'sys_bpf':
> | bpf.c:66:17: error: '__NR_bpf' undeclared (first use in this function)
> |  return syscall(__NR_bpf, cmd, attr, size);
> |                 ^~~~~~~~
> |                 sys_bpf
>
> The fix is to define a fallbak __NR_bpf.
>
> The obvious fix with be __arc__ specific value, but i think a better fix
> is to use the asm-generic uapi value applicable to ARC as well as any new
> arch (hopefully we don't add an old existing arch here). Otherwise I can
> just add __arc__

I prefer explicitly guard with __arc__. We still have arm/sh with different
__NR_bpf values. This patch will give wrong bpf syscall values for these
two architectures.

Alternatively, you could add support for arm/sh together
with your current patch. Hopefully I did not miss other architectures.

>
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
>  tools/lib/bpf/bpf.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/tools/lib/bpf/bpf.c b/tools/lib/bpf/bpf.c
> index 9cd015574e83..2c5eb7928400 100644
> --- a/tools/lib/bpf/bpf.c
> +++ b/tools/lib/bpf/bpf.c
> @@ -47,7 +47,10 @@
>  # elif defined(__s390__)
>  #  define __NR_bpf 351
>  # else
> -#  error __NR_bpf not defined. libbpf does not support your arch.
> +/*
> + * Any non listed arch (new) will have to asm-generic uapi complient
> + */
> +#  define __NR_bpf 280
>  # endif
>  #endif
>
> --
> 2.7.4
>
