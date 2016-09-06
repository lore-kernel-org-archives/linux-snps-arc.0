From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 6 Sep 2016 13:28:45 -0700
Subject: WTF: patch "[PATCH] ARC: Support syscall ABI v4" was seriously
 submitted to be applied to the 4.7-stable tree?
In-Reply-To: <7ab12d76-875a-c06f-08e3-ef628edda1b9@synopsys.com>
References: <1473080592214136@kroah.com>
 <584a8fcd-6876-de0d-3c5e-8b4dad12c49d@synopsys.com>
 <20160906193810.GB22028@kroah.com>
 <7ab12d76-875a-c06f-08e3-ef628edda1b9@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1e3ae422-d8ff-326e-29bd-b58002b5163b@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 09/06/2016 01:22 PM, Vineet Gupta wrote:
> > Not "we need to support gcc6 for
> > old kernels", as really, if someone wants to update userspace, they
> > don't update their kernel?

FWIW, I'm not arguing for the backport inclusion - I'm just trying to explain the
context more.

Thing is your regular user/customer don't really care/know about these details. So
there are tools bugs and more often than not the easy answer for tools providers
is "this is a known issue in gcc x.y which has been fixed in gcc x2.y2 so consider
upgrading". So it is for such class of users that having such backports makes life
a little easy.

Thx,
-Vineet
