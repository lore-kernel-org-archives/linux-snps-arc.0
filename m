Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1940ACAC597
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Sep 2025 12:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lEshJuk+AfZ6h7LV7EQW0fTC7ARA5PcRIzIwDZXTOUk=; b=GHHGfSNBNl/GAm
	5hjylvVWAbQopW+2d5x9yB5AvkGG+VgyQ02sctppTFQseZbeQBb3hCmEttacCrSsQy2ywUP9kjoXC
	WCt0jiRNUmOQx0QG1tLqxX+zcMVCMOUCVo50+6lEM1BCGXLYLdNCcwrP8y97T2F0WXI4VYsnK9nrf
	IX9ouIQxWAz/cSZ4BNbt0nLjv8l48M7LFRF7rw6n9Q3J6EA2EHdc9dNqI0FOITLZ4p1VGz50Pbqnx
	bUJZOdA1gXuM2FBJWAZNrmPzDtpVBq+VoGUwpHpmJSzRG/OvjL29TWucCcqMa9ofYmdI+dM9okN9d
	iwwmoQYN/pMA4q01tIsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8CN-000000046n3-3cXw;
	Mon, 15 Sep 2025 12:20:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8CL-000000046lr-3hGr;
	Mon, 15 Sep 2025 12:20:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8LbZZQXBwakk1o8HoHgvDq6wMKD6k92z7xv9wHGbqAg=; b=qriL60QvErCuV94eB/2ji76sLO
	AS/wAUwdma9N7/K4ngnC0BhR37kCBPm0AXqo6ChzYWuXCCENEGw1+lRPDvX1lMjE3m2QNsFjT9zx2
	+NCmNhLSZhbbmb6sCRJ/vv78aQhivyGYdERLLLBK/RvmqkVCtaY1IaxGS/nVELkpM9+aqPvnsSBO2
	3kkqcRIsyFOo3j2CsWZgNtUQ71+Ku58lCO+4o3Y4KQEpB0crwAo+IsD+M1Dj0j3bazqoy9/Hjzzl5
	wLlLMjWZ7j8aKwgNunbNFHckRelXzc43yPUiktE8aCOol1yfoYa+aadY398YB1mnK+jIW9ywAcMU/
	mz2V0IjA==;
Received: from pegase2.c-s.fr ([93.17.235.10])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8CH-00000006yZC-3YpN;
	Mon, 15 Sep 2025 12:20:44 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cQNk651SSz9sxh;
	Mon, 15 Sep 2025 13:54:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zyKNPbK2UxYX; Mon, 15 Sep 2025 13:54:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cQNk52qX4z9sxf;
	Mon, 15 Sep 2025 13:54:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 307338B766;
	Mon, 15 Sep 2025 13:54:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id kYegUs-5AFEi; Mon, 15 Sep 2025 13:54:37 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 92F668B763;
	Mon, 15 Sep 2025 13:54:36 +0200 (CEST)
Message-ID: <a246ee31-1ea3-4278-b103-65fda6e692a9@csgroup.eu>
Date: Mon, 15 Sep 2025 13:54:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 08/62] arm: init: remove FLAG_RDLOAD and
 FLAG_RDPROMPT
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
 <20250913003842.41944-9-safinaskar@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250913003842.41944-9-safinaskar@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_132042_043746_D24C02DB 
X-CRM114-Status: GOOD (  12.23  )
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
YS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQo+IAo+IFRoZXkgYXJlIHVudXNl
ZCBzaW5jZSBwcmV2aW91cyBjb21taXQKClNpbmNlIHdoaWNoIGNvbW1pdCA/Cgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEFza2FyIFNhZmluIDxzYWZpbmFza2FyQGdtYWlsLmNvbT4KPiAtLS0KPiAgIERv
Y3VtZW50YXRpb24vYXJjaC9hcm0vc2V0dXAucnN0IHwgNCArKy0tCj4gICBhcmNoL2FybS9rZXJu
ZWwvYXRhZ3NfY29tcGF0LmMgICB8IDIgLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Fy
Y2gvYXJtL3NldHVwLnJzdCBiL0RvY3VtZW50YXRpb24vYXJjaC9hcm0vc2V0dXAucnN0Cj4gaW5k
ZXggOGUxMmVmM2ZiOWE3Li5iZTc3ZDRiMmFhYzEgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9hcmNoL2FybS9zZXR1cC5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL2FyY2gvYXJtL3NldHVw
LnJzdAo+IEBAIC0zNSw4ICszNSw4IEBAIGJlbG93Ogo+ICAgICAgID09PT09ICAgPT09PT09PT09
PT09PT09PT09PT09PT09Cj4gICAgICAgYml0IDAgICAxID0gbW91bnQgcm9vdCByZWFkIG9ubHkK
PiAgICAgICBiaXQgMSAgIHVudXNlZAo+IC0gICAgYml0IDIgICAwID0gbG9hZCByYW1kaXNrCj4g
LSAgICBiaXQgMyAgIDAgPSBwcm9tcHQgZm9yIHJhbWRpc2sKPiArICAgIGJpdCAyICAgdW51c2Vk
Cj4gKyAgICBiaXQgMyAgIHVudXNlZAo+ICAgICAgID09PT09ICAgPT09PT09PT09PT09PT09PT09
PT09PT09Cj4gCj4gICAgcm9vdGRldgo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9rZXJuZWwvYXRh
Z3NfY29tcGF0LmMgYi9hcmNoL2FybS9rZXJuZWwvYXRhZ3NfY29tcGF0LmMKPiBpbmRleCBiOTc0
NzA2MWZhOTcuLjhkMDRlZGVlMzA2NiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9rZXJuZWwvYXRh
Z3NfY29tcGF0LmMKPiArKysgYi9hcmNoL2FybS9rZXJuZWwvYXRhZ3NfY29tcGF0LmMKPiBAQCAt
NDQsOCArNDQsNiBAQCBzdHJ1Y3QgcGFyYW1fc3RydWN0IHsKPiAgICAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZyByYW1kaXNrX3NpemU7ICAgICAgICAgLyogIDggKi8KPiAgICAgICAgICAgICAgdW5z
aWduZWQgbG9uZyBmbGFnczsgICAgICAgICAgICAgICAgLyogMTIgKi8KPiAgICNkZWZpbmUgRkxB
R19SRUFET05MWSAgMQo+IC0jZGVmaW5lIEZMQUdfUkRMT0FEICAgIDQKPiAtI2RlZmluZSBGTEFH
X1JEUFJPTVBUICA4Cj4gICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcm9vdGRldjsgICAgICAg
ICAgICAgIC8qIDE2ICovCj4gICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgdmlkZW9fbnVtX2Nv
bHM7ICAgICAgIC8qIDIwICovCj4gICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgdmlkZW9fbnVt
X3Jvd3M7ICAgICAgIC8qIDI0ICovCj4gLS0KPiAyLjQ3LjIKPiAKPiAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5n
IGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
