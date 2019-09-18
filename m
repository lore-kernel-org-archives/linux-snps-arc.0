From: gregkh@linuxfoundation.org (Greg Kroah-Hartman)
Date: Wed, 18 Sep 2019 20:56:33 +0200
Subject: stable backport for dc8635b78cd8669
In-Reply-To: <efb68643-3750-e94b-8387-6e4cacb3a82a@gmail.com>
References: <efb68643-3750-e94b-8387-6e4cacb3a82a@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190918185633.GB1944551@kroah.com>
To: linux-snps-arc@lists.infradead.org

On Wed, Sep 18, 2019@10:40:32AM -0700, Vineet Gupta wrote:
> Hi Stable team,
> 
> Can we please backport dc8635b78cd8669c37e230058d18c33af7451ab1 ("kernel/exit.c:
> export abort() to modules")
> 
> 0-Day kernel test infra reports ARC 4.x.y builds failing after backport of
> af1be2e21203867cb958aace ("ARC: handle gcc generated __builtin_trap for older
> compiler")

So is this only needed in 4.9.y and 4.4.y?

thanks,

greg k-h
