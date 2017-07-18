From: gregkh@linuxfoundation.org (Greg KH)
Date: Tue, 18 Jul 2017 07:08:38 +0200
Subject: [RFC PATCH 1/5] serial: arc: Remove __init marking from early
 write
In-Reply-To: <1500352203-21513-2-git-send-email-jeffy.chen@rock-chips.com>
References: <1500352203-21513-1-git-send-email-jeffy.chen@rock-chips.com>
 <1500352203-21513-2-git-send-email-jeffy.chen@rock-chips.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170718050838.GA7529@kroah.com>
To: linux-snps-arc@lists.infradead.org

On Tue, Jul 18, 2017@12:29:59PM +0800, Jeffy Chen wrote:
> The earlycon would be alive outside the init code in these cases:
> 1/ we have keep_bootcon in cmdline.
> 2/ we don't have a real console to switch to.
> 
> So remove the __init marking to avoid invalid memory access.
> 
> Signed-off-by: Jeffy Chen <jeffy.chen at rock-chips.com>
> ---
> 

I can't apply "RFC" patches.  If you have tested and found this series
to be correct, can you resend it without that on the patch?

thanks,

greg k-h
