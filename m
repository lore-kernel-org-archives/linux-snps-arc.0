From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 12 Dec 2017 15:57:06 +0000
Subject: [PATCH] arch: define weak abort
In-Reply-To: <1513027568-4800-1-git-send-email-sudipm.mukherjee@gmail.com>
References: <1513027568-4800-1-git-send-email-sudipm.mukherjee@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1513094225.4945.6.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Sudip,

On Mon, 2017-12-11@21:26 +0000, Sudip Mukherjee wrote:
> gcc was generating abort due to 'divide by zero' and if it is not
> defined in the toolchain the build fails.
> 
> Currently 'frv' and 'arc' are failing. Previously other arch was also
> broken like m32r was fixed by d22e3d69ee1a ("m32r: fix build failure").

Why don't we revert mentioned?d22e3d69ee1a ("m32r: fix build failure")
if not in the same patch but in the series together with this one?

-Alexey
