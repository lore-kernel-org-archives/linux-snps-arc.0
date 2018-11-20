From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 20 Nov 2018 15:52:03 +0000
Subject: [OE-core] [PATCH v3] u-boot: Add mkenvimage tool
In-Reply-To: <CAP9ODKqKDfJ11FLoXFwRZ3ttw4v3NODWEQdB7RkCAzHq7DWPiw@mail.gmail.com>
References: <20181119100443.2882-1-abrodkin@synopsys.com>
 <1fd9e473-66ba-bbb8-87a9-32bb78e359e3@denx.de>
 <20181119190835.GO11247@bill-the-cat>
 <CAP9ODKr6JkJ0HpOWMKXy6_qN61vwU=41xEAOveyzfqPnVqEcbQ@mail.gmail.com>
 <153f5864c09a48adb8c976d8671f3c46@XBOX04.axis.com>
 <CAJTo0LY=m+Y8HXgypQ0Jk0N1=ke6eopXjEOeYWNENJ83CJO8ZQ@mail.gmail.com>
 <CAJTo0Laecf+PnBPcg9qgHABvGwBEr+n7Sze3-OPp3OvbYBvJmw@mail.gmail.com>
 <CAP9ODKqKDfJ11FLoXFwRZ3ttw4v3NODWEQdB7RkCAzHq7DWPiw@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4881796E12491D4BB15146FE0209CE6468197CB6@DE02WEMBXB.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Otavio,

> -----Original Message-----
> From: Otavio Salvador [mailto:otavio.salvador at ossystems.com.br]
> Sent: Tuesday, November 20, 2018 6:49 PM
> To: Burton, Ross <ross.burton at intel.com>
> Cc: Peter Kjellerstedt <peter.kjellerstedt at axis.com>; Marek Vasut <marex at denx.de>; Tom Rini <trini at konsulko.com>; Otavio
> Salvador <otavio at ossystems.com.br>; Alexey Brodkin <alexey.brodkin at synopsys.com>; Patches and discussions about the oe-core
> layer <openembedded-core at lists.openembedded.org>; linux-snps-arc at lists.infradead.org
> Subject: Re: [OE-core] [PATCH v3] u-boot: Add mkenvimage tool
> 
> On Tue, Nov 20, 2018@1:40 PM Burton, Ross <ross.burton@intel.com> wrote:
> >
> > (hit sent too early)
> >
> > Of course how big are these tools, and is it really useful splitting
> > them up?  If we're talking a 10k binary, is putting them in separate
> > packages worth the complication?
> 
> I think it makes sense to split; we are building an embedded system
> build system and granular installation is a must have. Using PN to
> install all tools is a win win combination.

Please note we're discussing _host_ tools here!
So do we really care if there's one more utility installed on development host?

And if someone installs those U-Boot host utilities on the target then most probably
this target is not super embedded any longer.

-Alexey
