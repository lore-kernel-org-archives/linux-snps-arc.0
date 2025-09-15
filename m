Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BE5CAC597
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Sep 2025 12:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LV2WN0ZNYj3wLFmooVzvTnsiw3glTUpkEeF+39PHQwI=; b=ReCYu77ka9Ai18
	be+a/swjUGJsMu1JwlY9jjyGsw241Wi4tNSlDgvSbPigyakfR2g0/1j8WrhzkOGLqGkmsdXdLlloS
	KI+L3UCgMkJLH4QeGBasQQbjzVLYHz70Zqap5Ego71YvxzxLtn/kJdjipxdWiFhRwRAOZ1Se87EDl
	6nCwJrsDLdH+PJRLPnWE8h8tMJarH+Stppo8DdAbQrS7mEkMHe9W/Seu0nANHn7+j7QsD8pqQBTV2
	d67xuyrn8I5apfEbM1BfyrHkUNDWyDcvWfjilALLEMf3TWnftiNktxR5WFuaSP71DPtBs6vS9mwjj
	vSlR8GtVmrBI+Q6EJgmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8Cc-000000046zm-3DmI;
	Mon, 15 Sep 2025 12:21:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8Ca-000000046xk-1YIR;
	Mon, 15 Sep 2025 12:21:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=O1XbvmLD6s56hdCCZ7aKsrxIqtTrO4/3OkagSH/bFM4=; b=M98Lvy8DKySChL0onMt0wEzHPu
	55XveB1dUTa4SluwnDwGkwbxVaqpM5SKVrUwD6lOR+StZt4S1AZDYc4/SVbqrgv8GVp/xQ8zT7nNg
	QmNq+8r8Gzf6ecE2q4XnMlVgwKqkQDmh21QM+W7hQ8UNjSk3e46mHD0pEanazPSpE82wW8VJ8HgiS
	S2iK40bqyRuiOTsmSy1pzAzS3t39oUPRExoMczVXwNGv3fAVO+RUgIuT8rqFU23V7I9iYJMEgqBTK
	a1EqG3hg9hIf4ufhOD3vUSJqYkNfhK8Jrba/v8M/P0LknIxdrnGuAFXOe+pOxl2Q+5qx/bGBA9naj
	XDNECvQw==;
Received: from pegase2.c-s.fr ([93.17.235.10])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8CU-00000006ycK-2wO0;
	Mon, 15 Sep 2025 12:20:56 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cQNnR0pmTz9sxp;
	Mon, 15 Sep 2025 13:57:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CofbtF7b-0VV; Mon, 15 Sep 2025 13:57:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cQNnQ5DNGz9sxl;
	Mon, 15 Sep 2025 13:57:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 981DC8B766;
	Mon, 15 Sep 2025 13:57:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id aYicW_kKuipv; Mon, 15 Sep 2025 13:57:30 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 227808B763;
	Mon, 15 Sep 2025 13:57:30 +0200 (CEST)
Message-ID: <99563c3d-7322-4164-81f3-0d28e91ed653@csgroup.eu>
Date: Mon, 15 Sep 2025 13:57:29 +0200
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
X-CRM114-CacheID: sfid-20250915_132054_899158_D228B39C 
X-CRM114-Status: GOOD (  18.06  )
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
c2sgc2l6ZS4KPiAKPiBBbHNvIHRoaXMgYWxsb3dzIHVzIHRvIGNoYW5nZSByZF9zaXplIHZhcmlh
YmxlIHRvIHN0YXRpYwoKQ2FuIHlvdSBzcXVhc2ggcGF0Y2hlcyA2IHRvIDkgYWxsIHRvZ2V0aGVy
ID8KCj4gCj4gU2lnbmVkLW9mZi1ieTogQXNrYXIgU2FmaW4gPHNhZmluYXNrYXJAZ21haWwuY29t
Pgo+IC0tLQo+ICAgYXJjaC9hcm0va2VybmVsL2F0YWdzX3BhcnNlLmMgfCAxMiAtLS0tLS0tLS0t
LS0KPiAgIGRyaXZlcnMvYmxvY2svYnJkLmMgICAgICAgICAgIHwgIDggKysrKy0tLS0KPiAgIGlu
Y2x1ZGUvbGludXgvaW5pdHJkLmggICAgICAgIHwgIDMgLS0tCj4gICAzIGZpbGVzIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gv
YXJtL2tlcm5lbC9hdGFnc19wYXJzZS5jIGIvYXJjaC9hcm0va2VybmVsL2F0YWdzX3BhcnNlLmMK
PiBpbmRleCBhM2YwYTRmODRlMDQuLjYxNWQ5ZTgzYzliNSAxMDA2NDQKPiAtLS0gYS9hcmNoL2Fy
bS9rZXJuZWwvYXRhZ3NfcGFyc2UuYwo+ICsrKyBiL2FyY2gvYXJtL2tlcm5lbC9hdGFnc19wYXJz
ZS5jCj4gQEAgLTg3LDE4ICs4Nyw2IEBAIHN0YXRpYyBpbnQgX19pbml0IHBhcnNlX3RhZ192aWRl
b3RleHQoY29uc3Qgc3RydWN0IHRhZyAqdGFnKQo+ICAgX190YWd0YWJsZShBVEFHX1ZJREVPVEVY
VCwgcGFyc2VfdGFnX3ZpZGVvdGV4dCk7Cj4gICAjZW5kaWYKPiAKPiAtI2lmZGVmIENPTkZJR19C
TEtfREVWX1JBTQo+IC1zdGF0aWMgaW50IF9faW5pdCBwYXJzZV90YWdfcmFtZGlzayhjb25zdCBz
dHJ1Y3QgdGFnICp0YWcpCj4gLXsKPiAtICAgICAgIGlmICh0YWctPnUucmFtZGlzay5zaXplKQo+
IC0gICAgICAgICAgICAgICByZF9zaXplID0gdGFnLT51LnJhbWRpc2suc2l6ZTsKPiAtCj4gLSAg
ICAgICByZXR1cm4gMDsKPiAtfQo+IC0KPiAtX190YWd0YWJsZShBVEFHX1JBTURJU0ssIHBhcnNl
X3RhZ19yYW1kaXNrKTsKPiAtI2VuZGlmCj4gLQo+ICAgc3RhdGljIGludCBfX2luaXQgcGFyc2Vf
dGFnX3NlcmlhbG5yKGNvbnN0IHN0cnVjdCB0YWcgKnRhZykKPiAgIHsKPiAgICAgICAgICBzeXN0
ZW1fc2VyaWFsX2xvdyA9IHRhZy0+dS5zZXJpYWxuci5sb3c7Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvYmxvY2svYnJkLmMgYi9kcml2ZXJzL2Jsb2NrL2JyZC5jCj4gaW5kZXggMGMyZWFiZTE0YWYz
Li43MmYwMmQyYjhhOTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ibG9jay9icmQuYwo+ICsrKyBi
L2RyaXZlcnMvYmxvY2svYnJkLmMKPiBAQCAtMjcsNiArMjcsMTAgQEAKPiAKPiAgICNpbmNsdWRl
IDxsaW51eC91YWNjZXNzLmg+Cj4gCj4gK3N0YXRpYyB1bnNpZ25lZCBsb25nIHJkX3NpemUgPSBD
T05GSUdfQkxLX0RFVl9SQU1fU0laRTsKPiArbW9kdWxlX3BhcmFtKHJkX3NpemUsIHVsb25nLCAw
NDQ0KTsKPiArTU9EVUxFX1BBUk1fREVTQyhyZF9zaXplLCAiU2l6ZSBvZiBlYWNoIFJBTSBkaXNr
IGluIGtieXRlcy4iKTsKPiArCj4gICAvKgo+ICAgICogRWFjaCBibG9jayByYW1kaXNrIGRldmlj
ZSBoYXMgYSB4YXJyYXkgYnJkX3BhZ2VzIG9mIHBhZ2VzIHRoYXQgc3RvcmVzCj4gICAgKiB0aGUg
cGFnZXMgY29udGFpbmluZyB0aGUgYmxvY2sgZGV2aWNlJ3MgY29udGVudHMuCj4gQEAgLTIwOSwx
MCArMjEzLDYgQEAgc3RhdGljIGludCByZF9uciA9IENPTkZJR19CTEtfREVWX1JBTV9DT1VOVDsK
PiAgIG1vZHVsZV9wYXJhbShyZF9uciwgaW50LCAwNDQ0KTsKPiAgIE1PRFVMRV9QQVJNX0RFU0Mo
cmRfbnIsICJNYXhpbXVtIG51bWJlciBvZiBicmQgZGV2aWNlcyIpOwo+IAo+IC11bnNpZ25lZCBs
b25nIHJkX3NpemUgPSBDT05GSUdfQkxLX0RFVl9SQU1fU0laRTsKPiAtbW9kdWxlX3BhcmFtKHJk
X3NpemUsIHVsb25nLCAwNDQ0KTsKPiAtTU9EVUxFX1BBUk1fREVTQyhyZF9zaXplLCAiU2l6ZSBv
ZiBlYWNoIFJBTSBkaXNrIGluIGtieXRlcy4iKTsKPiAtCj4gICBzdGF0aWMgaW50IG1heF9wYXJ0
ID0gMTsKPiAgIG1vZHVsZV9wYXJhbShtYXhfcGFydCwgaW50LCAwNDQ0KTsKPiAgIE1PRFVMRV9Q
QVJNX0RFU0MobWF4X3BhcnQsICJOdW0gTWlub3JzIHRvIHJlc2VydmUgYmV0d2VlbiBkZXZpY2Vz
Iik7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaW5pdHJkLmggYi9pbmNsdWRlL2xpbnV4
L2luaXRyZC5oCj4gaW5kZXggNjMyMGE5Y2I2Njg2Li5iNDIyMzVjMjE0NDQgMTAwNjQ0Cj4gLS0t
IGEvaW5jbHVkZS9saW51eC9pbml0cmQuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvaW5pdHJkLmgK
PiBAQCAtNSw5ICs1LDYgQEAKPiAKPiAgICNkZWZpbmUgSU5JVFJEX01JTk9SIDI1MCAvKiBzaG91
bGRuJ3QgY29sbGlkZSB3aXRoIC9kZXYvcmFtKiB0b28gc29vbiAuLi4gKi8KPiAKPiAtLyogc2l6
ZSBvZiBhIHNpbmdsZSBSQU0gZGlzayAqLwo+IC1leHRlcm4gdW5zaWduZWQgbG9uZyByZF9zaXpl
Owo+IC0KPiAgIC8qIDEgaWYgaXQgaXMgbm90IGFuIGVycm9yIGlmIGluaXRyZF9zdGFydCA8IG1l
bW9yeV9zdGFydCAqLwo+ICAgZXh0ZXJuIGludCBpbml0cmRfYmVsb3dfc3RhcnRfb2s7Cj4gCj4g
LS0KPiAyLjQ3LjIKPiAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXNucHMtYXJjCg==
