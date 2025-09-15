Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84633CAC592
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Sep 2025 11:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/+qlEN+ip8RMkwlpBzoi67ennB46BSUJgqfAR24nSsY=; b=zV6BPjGxCr8krH
	cqMdtJNY4ZY7GhKrfnvOcLWi6qiphXTKIDwJgZYYN/7FIhQ/s4ehCQDXl18zhwjO5fksZofF+VZsY
	mBWFIfltU+/TYfu7EohxvsZQMsPFl0ZAnPKw4ABhcN+LvnBdfpG/MoDC3/ij2SOwimEKaRzccOXUW
	s4/NT7AF1tr3R+lELgOydNza3bzDClGzwvUqozzCyiMfq8IxjU/8uhjdu/DdP6x8FDaFTam+E18mi
	YaRb2tA1TUY5h/ukkK3E1cHjQqirXyGbBKu3pUDh0gwyaCBdX+ON/gDe5tA4qmtNaU+Lar80rn8Q/
	2qbzJCWB6u2kUdsK183Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7jT-000000040SV-0uG3;
	Mon, 15 Sep 2025 11:50:55 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7jQ-000000040OZ-3M0o;
	Mon, 15 Sep 2025 11:50:54 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cQMtW5q8Yz9sxd;
	Mon, 15 Sep 2025 13:16:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OLcbQxt2yUNY; Mon, 15 Sep 2025 13:16:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cQMtV4LnCz9sxb;
	Mon, 15 Sep 2025 13:16:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 706ED8B766;
	Mon, 15 Sep 2025 13:16:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id sggpKi6r1EPD; Mon, 15 Sep 2025 13:16:50 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B33B28B763;
	Mon, 15 Sep 2025 13:16:49 +0200 (CEST)
Message-ID: <053f39a9-06dc-4fbd-ad1b-325f9d3f3f66@csgroup.eu>
Date: Mon, 15 Sep 2025 13:16:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 02/62] init: remove deprecated "prompt_ramdisk"
 command line parameter, which does nothing
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
 Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
References: <20250913003842.41944-1-safinaskar@gmail.com>
 <20250913003842.41944-3-safinaskar@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250913003842.41944-3-safinaskar@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_045052_998268_FFCCBF47 
X-CRM114-Status: GOOD (  14.44  )
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
YS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQo+IAo+IFRoaXMgaXMgcHJlcGFy
YXRpb24gZm9yIGluaXRyZCByZW1vdmFsCgpTcXVhc2ggcGF0Y2ggMSBhbmQgcGF0Y2ggMiB0b2dl
dGhlciBhbmQgc2F5IHRoaXMgaXMgY2xlYW51cCBvZiB0d28gCm9wdGlvbnMgZGVwcmVjYXRlZCBi
eSBjb21taXQgYzgzNzY5OTRjODZjICgiaW5pdHJkOiByZW1vdmUgc3VwcG9ydCBmb3IgCm11bHRp
cGxlIGZsb3BwaWVzIikgd2l0aCB0aGUgZG9jdW1lbnRhdGlvbiBieSBjb21taXQgNmI5OWU2ZTZh
YTYyIAooIkRvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGU6IGJsb2NrZGV2L3JhbWRpc2s6IHJlbW92
ZSB1c2Ugb2YgInJkZXYiIikKCkNocmlzdG9waGUKCj4gCj4gU2lnbmVkLW9mZi1ieTogQXNrYXIg
U2FmaW4gPHNhZmluYXNrYXJAZ21haWwuY29tPgo+IC0tLQo+ICAgRG9jdW1lbnRhdGlvbi9hZG1p
bi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgfCAyIC0tCj4gICBhcmNoL2FybS9jb25maWdz
L25lcG9uc2V0X2RlZmNvbmZpZyAgICAgICAgICAgICB8IDIgKy0KPiAgIGluaXQvZG9fbW91bnRz
X3JkLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNyAtLS0tLS0tCj4gICAzIGZpbGVz
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgYi9Eb2N1
bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAo+IGluZGV4IGQzYjA1
Y2UyNDlmZi4uZjk0MGMxMTg0OTEyIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4t
Z3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1n
dWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKPiBAQCAtNTIyOSw4ICs1MjI5LDYgQEAKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgUGFyYW06IDxudW1iZXI+IC0gc3RlcC9idWNrZXQgc2l6ZSBh
cyBhIHBvd2VyIG9mIDIgZm9yCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Rh
dGlzdGljYWwgdGltZSBiYXNlZCBwcm9maWxpbmcuCj4gCj4gLSAgICAgICBwcm9tcHRfcmFtZGlz
az0gW1JBTV0gW0RlcHJlY2F0ZWRdCj4gLQo+ICAgICAgICAgIHByb3RfdmlydD0gICAgICBbUzM5
MF0gZW5hYmxlIGhvc3RpbmcgcHJvdGVjdGVkIHZpcnR1YWwgbWFjaGluZXMKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgaXNvbGF0ZWQgZnJvbSB0aGUgaHlwZXJ2aXNvciAoaWYgaGFyZHdhcmUg
c3VwcG9ydHMKPiAgICAgICAgICAgICAgICAgICAgICAgICAgdGhhdCkuIElmIGVuYWJsZWQsIHRo
ZSBkZWZhdWx0IGtlcm5lbCBiYXNlIGFkZHJlc3MKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vY29u
Zmlncy9uZXBvbnNldF9kZWZjb25maWcgYi9hcmNoL2FybS9jb25maWdzL25lcG9uc2V0X2RlZmNv
bmZpZwo+IGluZGV4IDE2ZjczMDAyMzlkYS4uNGQ3MjAwMDFjMTJlIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvYXJtL2NvbmZpZ3MvbmVwb25zZXRfZGVmY29uZmlnCj4gKysrIGIvYXJjaC9hcm0vY29uZmln
cy9uZXBvbnNldF9kZWZjb25maWcKPiBAQCAtOSw3ICs5LDcgQEAgQ09ORklHX0FTU0FCRVRfTkVQ
T05TRVQ9eQo+ICAgQ09ORklHX1pCT09UX1JPTV9URVhUPTB4ODAwMDAKPiAgIENPTkZJR19aQk9P
VF9ST01fQlNTPTB4YzEwMDAwMDAKPiAgIENPTkZJR19aQk9PVF9ST009eQo+IC1DT05GSUdfQ01E
TElORT0iY29uc29sZT10dHlTQTAsMzg0MDBuOCBjcHVmcmVxPTIyMTIwMCBydyByb290PS9kZXYv
bXRkYmxvY2syIG10ZHBhcnRzPXNhMTEwMDo1MTJLKGJvb3QpLDFNKGtlcm5lbCksMjU2MEsoaW5p
dHJkKSw0TShyb290KSBwcm9tcHRfcmFtZGlzaz0wIG1lbT0zMk0gbm9pbml0cmQgaW5pdHJkPTB4
YzA4MDAwMDAsM00iCj4gK0NPTkZJR19DTURMSU5FPSJjb25zb2xlPXR0eVNBMCwzODQwMG44IGNw
dWZyZXE9MjIxMjAwIHJ3IHJvb3Q9L2Rldi9tdGRibG9jazIgbXRkcGFydHM9c2ExMTAwOjUxMkso
Ym9vdCksMU0oa2VybmVsKSwyNTYwSyhpbml0cmQpLDRNKHJvb3QpIG1lbT0zMk0gbm9pbml0cmQg
aW5pdHJkPTB4YzA4MDAwMDAsM00iCj4gICBDT05GSUdfRlBFX05XRlBFPXkKPiAgIENPTkZJR19Q
TT15Cj4gICBDT05GSUdfTU9EVUxFUz15Cj4gZGlmZiAtLWdpdCBhL2luaXQvZG9fbW91bnRzX3Jk
LmMgYi9pbml0L2RvX21vdW50c19yZC5jCj4gaW5kZXggYWMwMjFhZTZlNmZhLi5mN2Q1M2JjMjFl
NDEgMTAwNjQ0Cj4gLS0tIGEvaW5pdC9kb19tb3VudHNfcmQuYwo+ICsrKyBiL2luaXQvZG9fbW91
bnRzX3JkLmMKPiBAQCAtMTcsMTMgKzE3LDYgQEAKPiAgIHN0YXRpYyBzdHJ1Y3QgZmlsZSAqaW5f
ZmlsZSwgKm91dF9maWxlOwo+ICAgc3RhdGljIGxvZmZfdCBpbl9wb3MsIG91dF9wb3M7Cj4gCj4g
LXN0YXRpYyBpbnQgX19pbml0IHByb21wdF9yYW1kaXNrKGNoYXIgKnN0cikKPiAtewo+IC0gICAg
ICAgcHJfd2FybigiaWdub3JpbmcgdGhlIGRlcHJlY2F0ZWQgcHJvbXB0X3JhbWRpc2s9IG9wdGlv
blxuIik7Cj4gLSAgICAgICByZXR1cm4gMTsKPiAtfQo+IC1fX3NldHVwKCJwcm9tcHRfcmFtZGlz
az0iLCBwcm9tcHRfcmFtZGlzayk7Cj4gLQo+ICAgaW50IF9faW5pdGRhdGEgcmRfaW1hZ2Vfc3Rh
cnQ7ICAgICAgICAgLyogc3RhcnRpbmcgYmxvY2sgIyBvZiBpbWFnZSAqLwo+IAo+ICAgc3RhdGlj
IGludCBfX2luaXQgcmFtZGlza19zdGFydF9zZXR1cChjaGFyICpzdHIpCj4gLS0KPiAyLjQ3LjIK
PiAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNu
cHMtYXJjCg==
