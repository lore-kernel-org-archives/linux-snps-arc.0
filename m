From: pavel@ucw.cz (Pavel Machek)
Date: Fri, 30 Mar 2018 09:55:08 +0200
Subject: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
In-Reply-To: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180330075508.GA21798@amd>
To: linux-snps-arc@lists.infradead.org

Hi!

> Current implementation doesn't randomize address returned by mmap.
> All the entropy ends with choosing mmap_base_addr at the process
> creation. After that mmap build very predictable layout of address
> space. It allows to bypass ASLR in many cases. This patch make
> randomization of address on any mmap call.

How will this interact with people debugging their application, and
getting different behaviours based on memory layout?

strace, strace again, get different results?

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 181 bytes
Desc: Digital signature
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20180330/ad6e292b/attachment.sig>
