Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F241CAC597
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Sep 2025 11:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x6vQ/lIM2O1bj5GT3vRYx1A2SfLAUy+v328r0EAHZmI=; b=StPcPfKly2ZWhb
	YzVkF+witxbzsinS2jPViM3vPXsJ9Gtjv5IScBFfN5Ssn+mssQwcr4CTMZUzngL+8WcA8A9+J5TZN
	2TRSXQHlTF+uxB38v2tCmQbRYfEy4gpHiPuKDZLyLXvIvase9aZzI07wl/ZbC3WFlnQBlwbq2NgOX
	dKl73FgUNEN8H3SbXsoMy1EDlOlpDZdKFPIuOqfv59FMXExTEcsgSnqp7CrupOwAJm8C8Q1SbjpcO
	yitX++V5WZhtRdcpGdG8a0n90xKMuUGeLSqRUF8cKz3liWDgbyfZMSJdNl2GQJxf5zev3uVyzomTb
	LOu/p+MHbJ54NttBx0KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7jK-000000040KG-3Y6M;
	Mon, 15 Sep 2025 11:50:46 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7jG-000000040ED-2I8j;
	Mon, 15 Sep 2025 11:50:43 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cQMxX3w10z9sxn;
	Mon, 15 Sep 2025 13:19:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lsQzt4OAL5QC; Mon, 15 Sep 2025 13:19:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cQMxW2nkYz9sxl;
	Mon, 15 Sep 2025 13:19:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 27EFC8B766;
	Mon, 15 Sep 2025 13:19:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id niL9xnZy0o5E; Mon, 15 Sep 2025 13:19:27 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6E3148B763;
	Mon, 15 Sep 2025 13:19:26 +0200 (CEST)
Message-ID: <c52c2589-9d7b-4ac7-a61f-68fa9ba18308@csgroup.eu>
Date: Mon, 15 Sep 2025 13:19:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 03/62] init: sh, sparc, x86: remove unused
 constants RAMDISK_PROMPT_FLAG and RAMDISK_LOAD_FLAG
To: Askar Safin <safinaskar@gmail.com>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>,
 Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Aleksa Sarai <cyphar@cyphar.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Julian Stecklina <julian.stecklina@cyberus-technology.de>,
 Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>,
 Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>,
 Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org,
 initramfs@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-ext4@vger.kernel.org, "Theodore Y . Ts'o" <tytso@mit.edu>,
 linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
 devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Kees Cook <kees@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>,
 Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev,
 stable+noautosel@kernel.org
References: <20250913003842.41944-1-safinaskar@gmail.com>
 <20250913003842.41944-4-safinaskar@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250913003842.41944-4-safinaskar@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_045042_746653_871E2F62 
X-CRM114-Status: GOOD (  11.86  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpMZSAxMy8wOS8yMDI1IMOgIDAyOjM3LCBBc2thciBTYWZpbiBhIMOpY3JpdMKgOgo+IFtWb3Vz
IG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIHNhZmluYXNrYXJAZ21haWwu
Y29tLiBEw6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCDDoCBodHRwczovL2Fr
YS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQo+IAo+IFRoZXkgd2VyZSB1c2Vk
IGZvciBpbml0cmQgYmVmb3JlIGM4Mzc2OTk0Yzg2Lgo+IAo+IGM4Mzc2OTk0Yzg2YyBtYWRlIHRo
ZW0gdW51c2VkIGFuZCBmb3Jnb3QgdG8gcmVtb3ZlIHRoZW0KPiAKPiBGaXhlczogYzgzNzY5OTRj
ODZjICgiaW5pdHJkOiByZW1vdmUgc3VwcG9ydCBmb3IgbXVsdGlwbGUgZmxvcHBpZXMiKQo+IENj
OiA8c3RhYmxlK25vYXV0b3NlbEBrZXJuZWwub3JnPiAjIGJlY2F1c2UgY2hhbmdlcyB1YXBpIGhl
YWRlcnMKPiBTaWduZWQtb2ZmLWJ5OiBBc2thciBTYWZpbiA8c2FmaW5hc2thckBnbWFpbC5jb20+
CgpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3Vw
LmV1PgoKPiAtLS0KPiAgIGFyY2gvc2gva2VybmVsL3NldHVwLmMgICAgICAgICAgICAgICAgfCAy
IC0tCj4gICBhcmNoL3NwYXJjL2tlcm5lbC9zZXR1cF8zMi5jICAgICAgICAgIHwgMiAtLQo+ICAg
YXJjaC9zcGFyYy9rZXJuZWwvc2V0dXBfNjQuYyAgICAgICAgICB8IDIgLS0KPiAgIGFyY2gveDg2
L2luY2x1ZGUvdWFwaS9hc20vYm9vdHBhcmFtLmggfCAyIC0tCj4gICBhcmNoL3g4Ni9rZXJuZWwv
c2V0dXAuYyAgICAgICAgICAgICAgIHwgMiAtLQo+ICAgNSBmaWxlcyBjaGFuZ2VkLCAxMCBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9zaC9rZXJuZWwvc2V0dXAuYyBiL2FyY2gv
c2gva2VybmVsL3NldHVwLmMKPiBpbmRleCAwMzlhNTEyOTEwMDIuLmQ2NmYwOThlOWU5ZiAxMDA2
NDQKPiAtLS0gYS9hcmNoL3NoL2tlcm5lbC9zZXR1cC5jCj4gKysrIGIvYXJjaC9zaC9rZXJuZWwv
c2V0dXAuYwo+IEBAIC03MSw4ICs3MSw2IEBAIEVYUE9SVF9TWU1CT0woc2hfbXYpOwo+ICAgZXh0
ZXJuIGludCByb290X21vdW50ZmxhZ3M7Cj4gCj4gICAjZGVmaW5lIFJBTURJU0tfSU1BR0VfU1RB
UlRfTUFTSyAgICAgICAweDA3RkYKPiAtI2RlZmluZSBSQU1ESVNLX1BST01QVF9GTEFHICAgICAg
ICAgICAgMHg4MDAwCj4gLSNkZWZpbmUgUkFNRElTS19MT0FEX0ZMQUcgICAgICAgICAgICAgIDB4
NDAwMAo+IAo+ICAgc3RhdGljIGNoYXIgX19pbml0ZGF0YSBjb21tYW5kX2xpbmVbQ09NTUFORF9M
SU5FX1NJWkVdID0geyAwLCB9Owo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3NwYXJjL2tlcm5lbC9z
ZXR1cF8zMi5jIGIvYXJjaC9zcGFyYy9rZXJuZWwvc2V0dXBfMzIuYwo+IGluZGV4IDcwNDM3NWMw
NjFlNy4uZWI2MGJlMzExMjdmIDEwMDY0NAo+IC0tLSBhL2FyY2gvc3BhcmMva2VybmVsL3NldHVw
XzMyLmMKPiArKysgYi9hcmNoL3NwYXJjL2tlcm5lbC9zZXR1cF8zMi5jCj4gQEAgLTE3Miw4ICsx
NzIsNiBAQCBleHRlcm4gdW5zaWduZWQgc2hvcnQgcm9vdF9mbGFnczsKPiAgIGV4dGVybiB1bnNp
Z25lZCBzaG9ydCByb290X2RldjsKPiAgIGV4dGVybiB1bnNpZ25lZCBzaG9ydCByYW1fZmxhZ3M7
Cj4gICAjZGVmaW5lIFJBTURJU0tfSU1BR0VfU1RBUlRfTUFTSyAgICAgICAweDA3RkYKPiAtI2Rl
ZmluZSBSQU1ESVNLX1BST01QVF9GTEFHICAgICAgICAgICAgMHg4MDAwCj4gLSNkZWZpbmUgUkFN
RElTS19MT0FEX0ZMQUcgICAgICAgICAgICAgIDB4NDAwMAo+IAo+ICAgZXh0ZXJuIGludCByb290
X21vdW50ZmxhZ3M7Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvc3BhcmMva2VybmVsL3NldHVwXzY0
LmMgYi9hcmNoL3NwYXJjL2tlcm5lbC9zZXR1cF82NC5jCj4gaW5kZXggNjM2MTVmNWM5OWI0Li5m
NzI4ZjFiMDBhY2EgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9zcGFyYy9rZXJuZWwvc2V0dXBfNjQuYwo+
ICsrKyBiL2FyY2gvc3BhcmMva2VybmVsL3NldHVwXzY0LmMKPiBAQCAtMTQ1LDggKzE0NSw2IEBA
IGV4dGVybiB1bnNpZ25lZCBzaG9ydCByb290X2ZsYWdzOwo+ICAgZXh0ZXJuIHVuc2lnbmVkIHNo
b3J0IHJvb3RfZGV2Owo+ICAgZXh0ZXJuIHVuc2lnbmVkIHNob3J0IHJhbV9mbGFnczsKPiAgICNk
ZWZpbmUgUkFNRElTS19JTUFHRV9TVEFSVF9NQVNLICAgICAgIDB4MDdGRgo+IC0jZGVmaW5lIFJB
TURJU0tfUFJPTVBUX0ZMQUcgICAgICAgICAgICAweDgwMDAKPiAtI2RlZmluZSBSQU1ESVNLX0xP
QURfRkxBRyAgICAgICAgICAgICAgMHg0MDAwCj4gCj4gICBleHRlcm4gaW50IHJvb3RfbW91bnRm
bGFnczsKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9ib290cGFy
YW0uaCBiL2FyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20vYm9vdHBhcmFtLmgKPiBpbmRleCBkYWZi
ZjU4MWM1MTUuLmY1M2RkM2YzMTliYSAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL3Vh
cGkvYXNtL2Jvb3RwYXJhbS5oCj4gKysrIGIvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9ib290
cGFyYW0uaAo+IEBAIC02LDggKzYsNiBAQAo+IAo+ICAgLyogcmFtX3NpemUgZmxhZ3MgKi8KPiAg
ICNkZWZpbmUgUkFNRElTS19JTUFHRV9TVEFSVF9NQVNLICAgICAgIDB4MDdGRgo+IC0jZGVmaW5l
IFJBTURJU0tfUFJPTVBUX0ZMQUcgICAgICAgICAgICAweDgwMDAKPiAtI2RlZmluZSBSQU1ESVNL
X0xPQURfRkxBRyAgICAgICAgICAgICAgMHg0MDAwCj4gCj4gICAvKiBsb2FkZmxhZ3MgKi8KPiAg
ICNkZWZpbmUgTE9BREVEX0hJR0ggICAgKDE8PDApCj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tl
cm5lbC9zZXR1cC5jIGIvYXJjaC94ODYva2VybmVsL3NldHVwLmMKPiBpbmRleCAxYjJlZGQwN2Ez
ZTEuLjY0MDllNzY2ZmIxNyAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni9rZXJuZWwvc2V0dXAuYwo+
ICsrKyBiL2FyY2gveDg2L2tlcm5lbC9zZXR1cC5jCj4gQEAgLTIyMyw4ICsyMjMsNiBAQCBleHRl
cm4gaW50IHJvb3RfbW91bnRmbGFnczsKPiAgIHVuc2lnbmVkIGxvbmcgc2F2ZWRfdmlkZW9fbW9k
ZTsKPiAKPiAgICNkZWZpbmUgUkFNRElTS19JTUFHRV9TVEFSVF9NQVNLICAgICAgIDB4MDdGRgo+
IC0jZGVmaW5lIFJBTURJU0tfUFJPTVBUX0ZMQUcgICAgICAgICAgICAweDgwMDAKPiAtI2RlZmlu
ZSBSQU1ESVNLX0xPQURfRkxBRyAgICAgICAgICAgICAgMHg0MDAwCj4gCj4gICBzdGF0aWMgY2hh
ciBfX2luaXRkYXRhIGNvbW1hbmRfbGluZVtDT01NQU5EX0xJTkVfU0laRV07Cj4gICAjaWZkZWYg
Q09ORklHX0NNRExJTkVfQk9PTAo+IC0tCj4gMi40Ny4yCj4gCj4gCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBs
aXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
