From: bruce.ashfield@gmail.com (Bruce Ashfield)
Date: Thu, 7 Feb 2019 13:20:04 -0500
Subject: [linux-yocto] [PATCH] don't check console device file on fs when
 booting with initrd/initramfs
In-Reply-To: <20190206130233.43745-1-abrodkin@synopsys.com>
References: <20190206130233.43745-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CADkTA4MHaADDaTPJT_WiZETFo7ey4m72+EFC-HNPCcYewwL8sQ@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Wed, Feb 6, 2019 at 8:10 AM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> In case of initrd/initramfs /dev/console might not exist that early
> as devtmpfs is mounted a bit later by /init process so disable this
> check in that case.

That's a reasonable tweak to the console check. I've applied the patch
to 4.19 and it will appear in future kernels as well. If you need it
on another version, let me know.

Bruce


>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> ---
>  init/main.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/init/main.c b/init/main.c
> index 387a2d7dc90b..5b904bc78fa4 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -1112,7 +1112,9 @@ static int __ref kernel_init(void *unused)
>
>  static noinline void __init kernel_init_freeable(void)
>  {
> +#ifndef CONFIG_BLK_DEV_INITRD
>         struct kstat console_stat;
> +#endif
>         /*
>          * Wait until kthreadd is all set-up.
>          */
> @@ -1144,11 +1146,17 @@ static noinline void __init kernel_init_freeable(void)
>
>         do_basic_setup();
>
> -       /* Use /dev/console to infer if the rootfs is setup properly */
> +#ifndef CONFIG_BLK_DEV_INITRD
> +       /*
> +        * Use /dev/console to infer if the rootfs is setup properly.
> +        * In case of initrd or initramfs /dev/console might be instantiated
> +        * later by /init so don't do this check for CONFIG_BLK_DEV_INITRD
> +        */
>         if (vfs_lstat((char __user *) "/dev/console", (struct kstat __user *) &console_stat)
>                         || !S_ISCHR(console_stat.mode)) {
>                 panic("/dev/console is missing or not a character device!\nPlease ensure your rootfs is properly configured\n");
>         }
> +#endif
>
>         /* Open the /dev/console on the rootfs, this should never fail */
>         if (ksys_open((const char __user *) "/dev/console", O_RDWR, 0) < 0)
> --
> 2.16.2
>
> --
> _______________________________________________
> linux-yocto mailing list
> linux-yocto at yoctoproject.org
> https://lists.yoctoproject.org/listinfo/linux-yocto



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
