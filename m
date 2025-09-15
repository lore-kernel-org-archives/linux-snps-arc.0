Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF69CAC592
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Sep 2025 12:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eeeIx0DY2coV4YH4GQ0daL2NX6ERJWLLmg1+dNvm2jg=; b=woGolfuUrXrrDy
	KgsGDgHgmaxyfI0qkFhal8ALwo+kmYaYIlxOcGi+HR7LDTKMr5RNgWgyitRHGdmPHmCX/VVPSPWlr
	6+Lc5Ny5XuIvBlrmI/X+3Y0+bFT6SjDgKG1uCZyxcSdNBBxa1+rEM2sNQooHM0lMT096ke3ZW+x4+
	wcIX1EX9TN6wGOpyKg+cTa9W6S0y44ja0UEtqys02sEaBHPolLfQFZvWX2rytxS3hd4vs9yIIpb3/
	pqqrLu4QXgcKSZDTiYbDJowt4P40c4S+uWg/Sek8YIHQUY3/WyZzKqBROvQ5Xmk749xNYS8aFabv9
	EIJmSPuh3z405rpnYsfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8CG-000000046i9-0TbC;
	Mon, 15 Sep 2025 12:20:40 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8CD-000000046gn-0f20;
	Mon, 15 Sep 2025 12:20:38 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cQNhn1N0hz9sxb;
	Mon, 15 Sep 2025 13:53:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id anqguhIbwei8; Mon, 15 Sep 2025 13:53:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cQNhm09sdz9sxY;
	Mon, 15 Sep 2025 13:53:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CE0528B766;
	Mon, 15 Sep 2025 13:53:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id xl8Y1gVm9bTH; Mon, 15 Sep 2025 13:53:27 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B538F8B763;
	Mon, 15 Sep 2025 13:53:26 +0200 (CEST)
Message-ID: <b7ecad05-9880-4443-b2d2-843cf6fcc937@csgroup.eu>
Date: Mon, 15 Sep 2025 13:53:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 06/62] arm: init: remove special logic for setting
 brd.rd_size
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
 <20250913003842.41944-7-safinaskar@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250913003842.41944-7-safinaskar@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_052037_359735_1629ACDB 
X-CRM114-Status: GOOD (  18.45  )
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
YS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQo+IAo+IFRoZXJlIGlzIG5vIGFu
eSByZWFzb24gZm9yIGhhdmluZyBzcGVjaWFsIG1lY2hhbmlzbQo+IGZvciBzZXR0aW5nIHJhbWRp
c2sgc2l6ZS4KClRoYXQncyB5b3Ugb3Bpbmlvbi4KCllvdSBzaG91bGQgZXhwbGFpbiB3aHkuCgo+
IAo+IEFsc28gdGhpcyBhbGxvd3MgdXMgdG8gY2hhbmdlIHJkX3NpemUgdmFyaWFibGUgdG8gc3Rh
dGljCj4gCj4gU2lnbmVkLW9mZi1ieTogQXNrYXIgU2FmaW4gPHNhZmluYXNrYXJAZ21haWwuY29t
Pgo+IC0tLQo+ICAgYXJjaC9hcm0va2VybmVsL2F0YWdzX3BhcnNlLmMgfCAxMiAtLS0tLS0tLS0t
LS0KPiAgIGRyaXZlcnMvYmxvY2svYnJkLmMgICAgICAgICAgIHwgIDggKysrKy0tLS0KPiAgIGlu
Y2x1ZGUvbGludXgvaW5pdHJkLmggICAgICAgIHwgIDMgLS0tCgpXaGF0IGFib3V0OgoKYXJjaC9t
aXBzL2tlcm5lbC9zZXR1cC5jOmVhcmx5X3BhcmFtKCJyZF9zaXplIiwgcmRfc2l6ZV9lYXJseSk7
CgpJcyBpdCB1bnJlbGF0ZWQgPwoKPiAgIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAxOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0va2VybmVsL2F0YWdz
X3BhcnNlLmMgYi9hcmNoL2FybS9rZXJuZWwvYXRhZ3NfcGFyc2UuYwo+IGluZGV4IGEzZjBhNGY4
NGUwNC4uNjE1ZDllODNjOWI1IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2tlcm5lbC9hdGFnc19w
YXJzZS5jCj4gKysrIGIvYXJjaC9hcm0va2VybmVsL2F0YWdzX3BhcnNlLmMKPiBAQCAtODcsMTgg
Kzg3LDYgQEAgc3RhdGljIGludCBfX2luaXQgcGFyc2VfdGFnX3ZpZGVvdGV4dChjb25zdCBzdHJ1
Y3QgdGFnICp0YWcpCj4gICBfX3RhZ3RhYmxlKEFUQUdfVklERU9URVhULCBwYXJzZV90YWdfdmlk
ZW90ZXh0KTsKPiAgICNlbmRpZgo+IAo+IC0jaWZkZWYgQ09ORklHX0JMS19ERVZfUkFNCj4gLXN0
YXRpYyBpbnQgX19pbml0IHBhcnNlX3RhZ19yYW1kaXNrKGNvbnN0IHN0cnVjdCB0YWcgKnRhZykK
PiAtewo+IC0gICAgICAgaWYgKHRhZy0+dS5yYW1kaXNrLnNpemUpCj4gLSAgICAgICAgICAgICAg
IHJkX3NpemUgPSB0YWctPnUucmFtZGlzay5zaXplOwo+IC0KPiAtICAgICAgIHJldHVybiAwOwo+
IC19Cj4gLQo+IC1fX3RhZ3RhYmxlKEFUQUdfUkFNRElTSywgcGFyc2VfdGFnX3JhbWRpc2spOwo+
IC0jZW5kaWYKPiAtCj4gICBzdGF0aWMgaW50IF9faW5pdCBwYXJzZV90YWdfc2VyaWFsbnIoY29u
c3Qgc3RydWN0IHRhZyAqdGFnKQo+ICAgewo+ICAgICAgICAgIHN5c3RlbV9zZXJpYWxfbG93ID0g
dGFnLT51LnNlcmlhbG5yLmxvdzsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9icmQuYyBi
L2RyaXZlcnMvYmxvY2svYnJkLmMKPiBpbmRleCAwYzJlYWJlMTRhZjMuLjcyZjAyZDJiOGE5OSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Jsb2NrL2JyZC5jCj4gKysrIGIvZHJpdmVycy9ibG9jay9i
cmQuYwo+IEBAIC0yNyw2ICsyNywxMCBAQAo+IAo+ICAgI2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3Mu
aD4KPiAKPiArc3RhdGljIHVuc2lnbmVkIGxvbmcgcmRfc2l6ZSA9IENPTkZJR19CTEtfREVWX1JB
TV9TSVpFOwo+ICttb2R1bGVfcGFyYW0ocmRfc2l6ZSwgdWxvbmcsIDA0NDQpOwo+ICtNT0RVTEVf
UEFSTV9ERVNDKHJkX3NpemUsICJTaXplIG9mIGVhY2ggUkFNIGRpc2sgaW4ga2J5dGVzLiIpOwo+
ICsKPiAgIC8qCj4gICAgKiBFYWNoIGJsb2NrIHJhbWRpc2sgZGV2aWNlIGhhcyBhIHhhcnJheSBi
cmRfcGFnZXMgb2YgcGFnZXMgdGhhdCBzdG9yZXMKPiAgICAqIHRoZSBwYWdlcyBjb250YWluaW5n
IHRoZSBibG9jayBkZXZpY2UncyBjb250ZW50cy4KPiBAQCAtMjA5LDEwICsyMTMsNiBAQCBzdGF0
aWMgaW50IHJkX25yID0gQ09ORklHX0JMS19ERVZfUkFNX0NPVU5UOwo+ICAgbW9kdWxlX3BhcmFt
KHJkX25yLCBpbnQsIDA0NDQpOwo+ICAgTU9EVUxFX1BBUk1fREVTQyhyZF9uciwgIk1heGltdW0g
bnVtYmVyIG9mIGJyZCBkZXZpY2VzIik7Cj4gCj4gLXVuc2lnbmVkIGxvbmcgcmRfc2l6ZSA9IENP
TkZJR19CTEtfREVWX1JBTV9TSVpFOwo+IC1tb2R1bGVfcGFyYW0ocmRfc2l6ZSwgdWxvbmcsIDA0
NDQpOwo+IC1NT0RVTEVfUEFSTV9ERVNDKHJkX3NpemUsICJTaXplIG9mIGVhY2ggUkFNIGRpc2sg
aW4ga2J5dGVzLiIpOwo+IC0KPiAgIHN0YXRpYyBpbnQgbWF4X3BhcnQgPSAxOwo+ICAgbW9kdWxl
X3BhcmFtKG1heF9wYXJ0LCBpbnQsIDA0NDQpOwo+ICAgTU9EVUxFX1BBUk1fREVTQyhtYXhfcGFy
dCwgIk51bSBNaW5vcnMgdG8gcmVzZXJ2ZSBiZXR3ZWVuIGRldmljZXMiKTsKPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9pbml0cmQuaCBiL2luY2x1ZGUvbGludXgvaW5pdHJkLmgKPiBpbmRl
eCA2MzIwYTljYjY2ODYuLmI0MjIzNWMyMTQ0NCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4
L2luaXRyZC5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9pbml0cmQuaAo+IEBAIC01LDkgKzUsNiBA
QAo+IAo+ICAgI2RlZmluZSBJTklUUkRfTUlOT1IgMjUwIC8qIHNob3VsZG4ndCBjb2xsaWRlIHdp
dGggL2Rldi9yYW0qIHRvbyBzb29uIC4uLiAqLwo+IAo+IC0vKiBzaXplIG9mIGEgc2luZ2xlIFJB
TSBkaXNrICovCj4gLWV4dGVybiB1bnNpZ25lZCBsb25nIHJkX3NpemU7Cj4gLQo+ICAgLyogMSBp
ZiBpdCBpcyBub3QgYW4gZXJyb3IgaWYgaW5pdHJkX3N0YXJ0IDwgbWVtb3J5X3N0YXJ0ICovCj4g
ICBleHRlcm4gaW50IGluaXRyZF9iZWxvd19zdGFydF9vazsKPiAKPiAtLQo+IDIuNDcuMgo+IAo+
IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1h
cmMK
