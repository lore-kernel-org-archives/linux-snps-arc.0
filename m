From: pavel@ucw.cz (Pavel Machek)
Date: Fri, 30 Mar 2018 11:57:35 +0200
Subject: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
In-Reply-To: <95EECC28-7349-4FB4-88BF-26E4CF087A0B@gmail.com>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180330075508.GA21798@amd>
 <95EECC28-7349-4FB4-88BF-26E4CF087A0B@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180330095735.GA15641@amd>
To: linux-snps-arc@lists.infradead.org

On Fri 2018-03-30 12:07:58, Ilya Smith wrote:
> Hi
> 
> > On 30 Mar 2018,@10:55, Pavel Machek <pavel@ucw.cz> wrote:
> > 
> > Hi!
> > 
> >> Current implementation doesn't randomize address returned by mmap.
> >> All the entropy ends with choosing mmap_base_addr at the process
> >> creation. After that mmap build very predictable layout of address
> >> space. It allows to bypass ASLR in many cases. This patch make
> >> randomization of address on any mmap call.
> > 
> > How will this interact with people debugging their application, and
> > getting different behaviours based on memory layout?
> > 
> > strace, strace again, get different results?
> > 
> 
> Honestly I?m confused about your question. If the only one way for debugging 
> application is to use predictable mmap behaviour, then something went wrong in 
> this live and we should stop using computers at all.

I'm not saying "only way". I'm saying one way, and you are breaking
that. There's advanced stuff like debuggers going "back in time".

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
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20180330/2476295d/attachment.sig>
