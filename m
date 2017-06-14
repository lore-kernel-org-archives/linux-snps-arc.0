From: mmarek@suse.com (Michal Marek)
Date: Wed, 14 Jun 2017 15:02:36 +0200
Subject: [PATCH] Unexport LANG env variable
In-Reply-To: <1497444056-24962-1-git-send-email-abrodkin@synopsys.com>
References: <1497444056-24962-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <51f658dc-215a-6c0c-0ab9-d1164812a56d@suse.com>
To: linux-snps-arc@lists.infradead.org

Dne 14.6.2017 v 14:40 Alexey Brodkin napsal(a):
> In those cases when we parse output of standard utilities like readelf
> etc we rely on a particular sentences. For example for ARC we extract
> an entry-point from vmlinux like that:
> ---------------------->8--------------------
> readelf -h vmlinux | grep "Entry point address" | grep -o 0x.*
> ---------------------->8--------------------
> 
> And in case LANG is set to anything other than en_XX we're getting
> nothing and subsequent execution of mkimage utility fails.
> 
> Probably there're more cases like that but given people rarely
> use non-English locales on their dev machines problems like the one
> above are not very visible.

I'm all for this change but the *.po files in the gcc tree must have
been created for a reason:

  https://github.com/gcc-mirror/gcc/tree/master/gcc/po

:)

Michal
