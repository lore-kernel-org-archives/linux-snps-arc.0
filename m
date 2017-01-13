From: dhowells@redhat.com (David Howells)
Date: Fri, 13 Jan 2017 15:43:49 +0000
Subject: No subject
In-Reply-To: <1484304406-10820-5-git-send-email-nicolas.dichtel@6wind.com>
References: <1484304406-10820-5-git-send-email-nicolas.dichtel@6wind.com>
 <3131144.4Ej3KFWRbz@wuerfel>
 <1484304406-10820-1-git-send-email-nicolas.dichtel@6wind.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <25483.1484322229@warthog.procyon.org.uk>
To: linux-snps-arc@lists.infradead.org

> -header-y += msr-index.h

I see it on my desktop as /usr/include/asm/msr-index.h and it's been there at
least four years - and as such it's part of the UAPI.  I don't think you can
remove it unless you can guarantee there are no userspace users.

David
