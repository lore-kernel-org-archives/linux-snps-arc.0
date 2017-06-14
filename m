From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 14 Jun 2017 13:11:07 +0000
Subject: [PATCH] Unexport LANG env variable
In-Reply-To: <51f658dc-215a-6c0c-0ab9-d1164812a56d@suse.com>
References: <1497444056-24962-1-git-send-email-abrodkin@synopsys.com>
 <51f658dc-215a-6c0c-0ab9-d1164812a56d@suse.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1497445867.6424.36.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Michal,

On Wed, 2017-06-14@15:02 +0200, Michal Marek wrote:
> Dne 14.6.2017 v 14:40 Alexey Brodkin napsal(a):
> > 
> > In those cases when we parse output of standard utilities like readelf
> > etc we rely on a particular sentences. For example for ARC we extract
> > an entry-point from vmlinux like that:
> > ---------------------->8--------------------
> > readelf -h vmlinux | grep "Entry point address" | grep -o 0x.*
> > ---------------------->8--------------------
> > 
> > And in case LANG is set to anything other than en_XX we're getting
> > nothing and subsequent execution of mkimage utility fails.
> > 
> > Probably there're more cases like that but given people rarely
> > use non-English locales on their dev machines problems like the one
> > above are not very visible.
> 
> I'm all for this change but the *.po files in the gcc tree must have
> been created for a reason:
> 
> ? https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_gcc-2Dmirror_gcc_tree_master_gcc_po&d=DwICBA&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes
> 0GFDDl656eViXO7breS55ytWkhpk5R81I&m=v2ilYYv6Z0WzVaIys3sCQdK3QBI9gqH7hUmoTGPpJ44&s=S3B79SHovtt1-wLRtngTUM0dKWMiokGE75HIrfgkbbc&e=?

That's for sure.

But then how may we have a predictable environment for our machinery?

I do realize that with that change in place people will start seeing
non-translated messages from other tools like compiler etc.

But probably that's not the worst idea as well because it helps googling :)

-Alexey
