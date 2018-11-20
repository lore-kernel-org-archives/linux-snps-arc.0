From: trini@konsulko.com (Tom Rini)
Date: Tue, 20 Nov 2018 10:52:17 -0500
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
Message-ID: <20181120155217.GA11247@bill-the-cat>
To: linux-snps-arc@lists.infradead.org

On Tue, Nov 20, 2018@01:48:40PM -0200, Otavio Salvador wrote:
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

Agreed.  The common use cases won't need all of the possible tools so
lets not grow sizes we don't need to grow.

-- 
Tom
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20181120/5e8f3cba/attachment-0001.sig>
