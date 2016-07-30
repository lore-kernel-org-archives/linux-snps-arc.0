From: linux@roeck-us.net (Guenter Roeck)
Date: Fri, 29 Jul 2016 21:27:10 -0700
Subject: Build failure in linux mainline when building arcv2 images
In-Reply-To: <1cc37edf-d48e-9b98-1bb6-f20e319cf12b@synopsys.com>
References: <579ACC26.9020106@roeck-us.net>
 <25e43ee1-5015-9dc3-777e-6101872f2ec4@synopsys.com>
 <579B5D79.8060907@roeck-us.net>
 <66774d12-285a-438f-c050-fba65601bd3c@synopsys.com>
 <20160729214854.GA21977@roeck-us.net>
 <1cc37edf-d48e-9b98-1bb6-f20e319cf12b@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <579C2C9E.6040904@roeck-us.net>
To: linux-snps-arc@lists.infradead.org

On 07/29/2016 03:46 PM, Vineet Gupta wrote:

> What you want is
> 2016-05-19 09439560b9f9 toolchain: bump ARC tools to arc-2016.03 release
>
> which seems to be present in released 2016.05, but when I checkout 2016.05 tag (or
> aa6fd11feebff) that patch is not there !
>

A toolchain build off SHA 09439560b9f9 works.

Thanks!

Guenter
