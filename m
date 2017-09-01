From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 1 Sep 2017 11:48:09 +0000
Subject: [PATCH] arc: Re-enable MMU upon die()
In-Reply-To: <d2b588da61b35312a3126b605685f22bc30fc3ae.1504265945.git.joabreu@synopsys.com>
References: <d2b588da61b35312a3126b605685f22bc30fc3ae.1504265945.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1504266488.15144.3.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Jose,

On Fri, 2017-09-01@12:39 +0100, Jose Abreu wrote:
> I recently came upon a scenario where I would get a double fault
> after a machine check error. It turns out that for Ksymbol lookup
> to work with modules we need to have MMU enabled because module
> address is mapped in the cached space.
> 
> This patch re-enables the MMU before start printing the stacktrace
> making stacktracing of modules work upon a fatal exception.

I'm wondering how do we end up with MMU disabled?
