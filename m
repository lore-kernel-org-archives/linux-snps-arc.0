From: tklauser@distanz.ch (Tobias Klauser)
Date: Fri, 13 Jan 2017 11:55:50 +0100
Subject: [PATCH v3 3/8] nios2: put setup.h in uapi
In-Reply-To: <1484304406-10820-4-git-send-email-nicolas.dichtel@6wind.com>
References: <3131144.4Ej3KFWRbz@wuerfel>
 <1484304406-10820-1-git-send-email-nicolas.dichtel@6wind.com>
 <1484304406-10820-4-git-send-email-nicolas.dichtel@6wind.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170113105550.GD1201@distanz.ch>
To: linux-snps-arc@lists.infradead.org

On 2017-01-13@11:46:41 +0100, Nicolas Dichtel <nicolas.dichtel@6wind.com> wrote:
> This header file is exported, but from a userland pov, it's just a wrapper
> to asm-generic/setup.h.
> 
> Signed-off-by: Nicolas Dichtel <nicolas.dichtel at 6wind.com>

Reviewed-by: Tobias Klauser <tklauser at distanz.ch>
