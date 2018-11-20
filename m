From: ross.burton@intel.com (Burton, Ross)
Date: Tue, 20 Nov 2018 15:39:20 +0000
Subject: [OE-core] [PATCH v3] u-boot: Add mkenvimage tool
In-Reply-To: <153f5864c09a48adb8c976d8671f3c46@XBOX04.axis.com>
References: <20181119100443.2882-1-abrodkin@synopsys.com>
 <1fd9e473-66ba-bbb8-87a9-32bb78e359e3@denx.de>
 <20181119190835.GO11247@bill-the-cat>
 <CAP9ODKr6JkJ0HpOWMKXy6_qN61vwU=41xEAOveyzfqPnVqEcbQ@mail.gmail.com>
 <153f5864c09a48adb8c976d8671f3c46@XBOX04.axis.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAJTo0LY=m+Y8HXgypQ0Jk0N1=ke6eopXjEOeYWNENJ83CJO8ZQ@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Tue, 20 Nov 2018 at 14:29, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> Actually, why mess with an unnecessary meta package. Just use the
> empty ${PN} package for that. That works for the GStreamer packages
> as well these days (since commit 8e1009a3), even though they do it
> by depending on the meta packages for backwards compatibility.

Yes, please.

Having a u-boot-tools-meta will mean we're constantly explaining why
installing u-boot-tools either doesn't install anything, or produces
an error.

Ross
