Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E1FCAC592
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Sep 2025 12:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0H/NpoU2ateLXUBxGSrE+uEQUsGP29SiYZ8W6RUMeRA=; b=M6L0QcWhHLb226
	Ep7ZXTMP5RKjKj2WymCD5WKgGhVZTiYzXzB3+KuBSMI8YbkCPct9dmRDbKYREeib3wPFz2SRBkuVV
	pGrEiot9vV4e5fuog32f9FKaQmFXZ4VDVY5E4l3Om+vWaMOZ+Z9eW01QzIpQ/kmhuRg4xUyRLk5Gy
	PSzp4ATitg1mwAUQ1uGYEYgxxrFTb1NAT7bACLVpP4h9dGA5/Fr88GFowTi8sl0BC9CeE3tpMEdA7
	DwYTxK6xNbPoSe8+VNuOI5sfpIFhjkDa9y78x+jLuKZ613bgZeGIrQ8xEatrdfOCE44SNGqTNi/Ai
	73wzS0cu80j2h0ZwDyMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8CU-000000046u3-12Vi;
	Mon, 15 Sep 2025 12:20:54 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8CR-000000046pN-1v6Q;
	Mon, 15 Sep 2025 12:20:52 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cQNZf0vcmz9syy;
	Mon, 15 Sep 2025 13:48:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 94pnKAlpBYHg; Mon, 15 Sep 2025 13:48:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cQNZd5CrVz9syw;
	Mon, 15 Sep 2025 13:48:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7E35C8B766;
	Mon, 15 Sep 2025 13:48:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id uLBCpzlqUS-U; Mon, 15 Sep 2025 13:48:09 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DC6128B763;
	Mon, 15 Sep 2025 13:48:08 +0200 (CEST)
Message-ID: <fe3aea1c-24eb-49f4-9ce3-8f132d8814be@csgroup.eu>
Date: Mon, 15 Sep 2025 13:48:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 05/62] init: remove "ramdisk_start" command line
 parameter, which controls starting block number of initrd
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
 <20250913003842.41944-6-safinaskar@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250913003842.41944-6-safinaskar@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_052051_655664_30BF4A7D 
X-CRM114-Status: GOOD (  18.88  )
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

SGF2ZSBhIHNpbXBsZXIgc3ViamVjdCwKCkxlIDEzLzA5LzIwMjUgw6AgMDI6MzcsIEFza2FyIFNh
ZmluIGEgw6ljcml0wqA6Cj4gW1ZvdXMgbmUgcmVjZXZleiBwYXMgc291dmVudCBkZSBjb3Vycmll
cnMgZGUgc2FmaW5hc2thckBnbWFpbC5jb20uIETDqWNvdXZyZXogcG91cnF1b2kgY2VjaSBlc3Qg
aW1wb3J0YW50IMOgIGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlv
biBdCj4gCj4gVGhpcyBpcyBwcmVwYXJhdGlvbiBmb3IgaW5pdHJkIHJlbW92YWwKCmFuZCBtYWtl
IGEgbW9yZSBpbnRlcmVzdGluZyBtZXNzYWdlLgoKCkZvciBtZSBpdCB3b3VsZCBtYWtlIG1vcmUg
c2Vuc2UgdG8gcmVtb3ZlIHJhbWRpc2tfc3RhcnQgYW5kIHJhbWRpc2tfc2l6ZSAKYXQgdGhlIHNh
bWUgdGltZS4KCkNocmlzdG9waGUKCj4gCj4gU2lnbmVkLW9mZi1ieTogQXNrYXIgU2FmaW4gPHNh
ZmluYXNrYXJAZ21haWwuY29tPgo+IC0tLQo+ICAgRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9i
bG9ja2Rldi9yYW1kaXNrLnJzdCAgfCAzICstLQo+ICAgRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlk
ZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgfCAyIC0tCj4gICBpbml0L2RvX21vdW50c19yZC5jICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDcgLS0tLS0tLQo+ICAgMyBmaWxlcyBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMTEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vYWRtaW4tZ3VpZGUvYmxvY2tkZXYvcmFtZGlzay5yc3QgYi9Eb2N1bWVudGF0aW9u
L2FkbWluLWd1aWRlL2Jsb2NrZGV2L3JhbWRpc2sucnN0Cj4gaW5kZXggOWNlNjEwMWU4ZGQ5Li5l
NTdjNjExMDhkYmMgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9ibG9j
a2Rldi9yYW1kaXNrLnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvYmxvY2tk
ZXYvcmFtZGlzay5yc3QKPiBAQCAtNzQsMTIgKzc0LDExIEBAIGFyY2gveDg2L2Jvb3QvTWFrZWZp
bGUuCj4gCj4gICBTb21lIG9mIHRoZSBrZXJuZWwgY29tbWFuZCBsaW5lIGJvb3Qgb3B0aW9ucyB0
aGF0IG1heSBhcHBseSBoZXJlIGFyZTo6Cj4gCj4gLSAgcmFtZGlza19zdGFydD1OCj4gICAgIHJh
bWRpc2tfc2l6ZT1NCj4gCj4gICBJZiB5b3UgbWFrZSBhIGJvb3QgZGlzayB0aGF0IGhhcyBMSUxP
LCB0aGVuIGZvciB0aGUgYWJvdmUsIHlvdSB3b3VsZCB1c2U6Ogo+IAo+IC0gICAgICAgYXBwZW5k
ID0gInJhbWRpc2tfc3RhcnQ9TiByYW1kaXNrX3NpemU9TSIKPiArICAgICAgIGFwcGVuZCA9ICJy
YW1kaXNrX3NpemU9TSIKPiAKPiAgIDQpIEFuIEV4YW1wbGUgb2YgQ3JlYXRpbmcgYSBDb21wcmVz
c2VkIFJBTSBEaXNrCj4gICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1w
YXJhbWV0ZXJzLnR4dCBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRl
cnMudHh0Cj4gaW5kZXggZjk0MGMxMTg0OTEyLi4wN2U4ODc4ZjFlMTMgMTAwNjQ0Cj4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKPiArKysgYi9E
b2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAo+IEBAIC01Mjg1
LDggKzUyODUsNiBAQAo+ICAgICAgICAgIHJhbWRpc2tfc2l6ZT0gICBbUkFNXSBTaXplcyBvZiBS
QU0gZGlza3MgaW4ga2lsb2J5dGVzCj4gICAgICAgICAgICAgICAgICAgICAgICAgIFNlZSBEb2N1
bWVudGF0aW9uL2FkbWluLWd1aWRlL2Jsb2NrZGV2L3JhbWRpc2sucnN0Lgo+IAo+IC0gICAgICAg
cmFtZGlza19zdGFydD0gIFtSQU1dIFJBTSBkaXNrIGltYWdlIHN0YXJ0IGFkZHJlc3MKPiAtCj4g
ICAgICAgICAgcmFuZG9tLnRydXN0X2NwdT1vZmYKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
W0tOTCxFQVJMWV0gRGlzYWJsZSB0cnVzdGluZyB0aGUgdXNlIG9mIHRoZSBDUFUncwo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICByYW5kb20gbnVtYmVyIGdlbmVyYXRvciAoaWYgYXZhaWxhYmxl
KSB0bwo+IGRpZmYgLS1naXQgYS9pbml0L2RvX21vdW50c19yZC5jIGIvaW5pdC9kb19tb3VudHNf
cmQuYwo+IGluZGV4IDhlMGE3NzRhOWM2Zi4uODY0ZmE4OGQ5Zjg5IDEwMDY0NAo+IC0tLSBhL2lu
aXQvZG9fbW91bnRzX3JkLmMKPiArKysgYi9pbml0L2RvX21vdW50c19yZC5jCj4gQEAgLTE3LDEz
ICsxNyw2IEBACj4gICBzdGF0aWMgc3RydWN0IGZpbGUgKmluX2ZpbGUsICpvdXRfZmlsZTsKPiAg
IHN0YXRpYyBsb2ZmX3QgaW5fcG9zLCBvdXRfcG9zOwo+IAo+IC1zdGF0aWMgaW50IF9faW5pdCBy
YW1kaXNrX3N0YXJ0X3NldHVwKGNoYXIgKnN0cikKPiAtewo+IC0gICAgICAgLyogd2lsbCBiZSBy
ZW1vdmVkIGluIG5leHQgY29tbWl0ICovCj4gLSAgICAgICByZXR1cm4gMTsKPiAtfQo+IC1fX3Nl
dHVwKCJyYW1kaXNrX3N0YXJ0PSIsIHJhbWRpc2tfc3RhcnRfc2V0dXApOwo+IC0KPiAgIHN0YXRp
YyBpbnQgX19pbml0IGNyZF9sb2FkKGRlY29tcHJlc3NfZm4gZGVjbyk7Cj4gCj4gICAvKgo+IC0t
Cj4gMi40Ny4yCj4gCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1zbnBzLWFyYwo=
