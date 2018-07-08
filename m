From: greg@kroah.com (Greg KH)
Date: Sun, 8 Jul 2018 20:40:49 +0200
Subject: [PATCH v2] devres: Really align data field to unsigned long long
In-Reply-To: <20180708175621.6951-1-abrodkin@synopsys.com>
References: <20180708175621.6951-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180708184049.GA1645@kroah.com>
To: linux-snps-arc@lists.infradead.org

On Sun, Jul 08, 2018@08:56:21PM +0300, Alexey Brodkin wrote:
> Depending on ABI "long long" type of a particular 32-bit CPU
> might be aligned by either word (32-bits) or double word (64-bits).
> Make sure "data" is really 64-bit aligned for any 32-bit CPU.
> 
> At least for 32-bit ARC cores ABI requires "long long" types
> to be aligned by normal 32-bit word. This makes "data" field aligned to
> 12 bytes. Which is still OK as long as we use 32-bit data only.
> 
> But once we want to use native atomic64_t type (i.e. when we use special
> instructions LLOCKD/SCONDD for accessing 64-bit data) we easily hit
> misaligned access exception.
> 
> That's because even on CPUs capable of non-aligned data access LL/SC
> instructions require strict alignment.
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Thomas Gleixner <tglx at linutronix.de>
> Cc: stable at vger.kernel.org
> ---
> 
> Changes v1 -> v2:
> 
>  * Reworded commit message
>  * Inserted comment right in source [Thomas]
> 
>  drivers/base/devres.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Always use scripts/get_maintainer.pl to properly cc: the needed
developer/maintainer.  As it is, this patch is going to get dropped on
the floor, sorry...

greg k-h
