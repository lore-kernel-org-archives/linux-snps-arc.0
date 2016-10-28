From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 28 Oct 2016 14:03:21 -0700
Subject: [PATCH] lpfc: use %zd format string for size_t
In-Reply-To: <20161017123605.2217411-1-arnd@arndb.de>
References: <20161017123605.2217411-1-arnd@arndb.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <26e675e3-af5b-eaf7-fea0-b4aff9767332@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Arnd,

On 10/17/2016 05:35 AM, Arnd Bergmann wrote:
> A recent bugfix introduced a harmless warning in the lpfc driver:
> 
> drivers/scsi/lpfc/lpfc_init.c: In function 'lpfc_write_firmware':
> drivers/scsi/lpfc/lpfc_logmsg.h:56:45: error: format '%ld' expects argument of type 'long int', but argument 9 has type 'size_t {aka const unsigned int}' [-Werror=format=]
> 
> 'size_t' is always the same width as 'long' in the kernel, but the compiler
> doesn't know that. The %z modifier is what the standard expects to be
> used here, and this shuts up the warning.
> 
> Fixes: 679053c651fb ("scsi: lpfc: Fix fw download on SLI-4 FC adapters")
> Signed-off-by: Arnd Bergmann <arnd at arndb.de>
> ---
>  drivers/scsi/lpfc/lpfc_init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
> index 7be9b8a7bb19..4776fd85514f 100644
> --- a/drivers/scsi/lpfc/lpfc_init.c
> +++ b/drivers/scsi/lpfc/lpfc_init.c
> @@ -10332,7 +10332,7 @@ lpfc_write_firmware(const struct firmware *fw, void *context)
>  	    ftype != LPFC_FILE_TYPE_GROUP || fsize != fw->size) {
>  		lpfc_printf_log(phba, KERN_ERR, LOG_INIT,
>  				"3022 Invalid FW image found. "
> -				"Magic:%x Type:%x ID:%x Size %d %ld\n",
> +				"Magic:%x Type:%x ID:%x Size %d %zd\n",
>  				magic_number, ftype, fid, fsize, fw->size);
>  		rc = -EINVAL;
>  		goto release_out;
> 

I'm trying to use about to be released ARC gcc 6.x with current kernels and see a
flood of warnings due to these legit fixes - i.e.g arc gcc 6.2 complains when it
sees -zx formats.

CC      mm/percpu.o
../mm/percpu.c: In function ?pcpu_alloc?:
../mm/percpu.c:890:14: warning: format ?%zu? expects argument of type ?size_t?,
but argument 4 has type ?unsigned int? [-Wformat=]
   WARN(true, "illegal size (%zu) or align (%zu) for percpu allocation\n",

I'm not sure what is going on since the data type is size_t alright - although
from posix_types.h is

typedef unsigned int __kernel_size_t;
typedef __kernel_size_t size_t;

And this seems to be same for ARC as well as ARM. I tried ARM gcc 6.1 @
https://snapshots.linaro.org/components/toolchain/binaries/6.1-2016.08-rc1/arm-linux-gnueabihf/

which doesn't seem to be complaining.

With V=1, I checked the respective ARM and ARC toggles in play, but nothing
related to this seems to be standing out.

I know this is more of a question to our GNU folks, but was wondering if you had
more insight into it - which you almost always do :-)

Thx,
-Vineet
