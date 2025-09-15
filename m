Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3183CAC592
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Sep 2025 12:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=88Zw40UpEhjsY9FTi1qHTCV/0vc2PRCedDveI/PqB8E=; b=lIigzynStrkC0+
	kBpV4a0NliRIzkPg8suebCGOOyBtz1OIFim0ZP2XZIze8JUqc51ClVIk6Gf+cTtmssFDTUx2d/uih
	P9KO827YP7IqDSJO2tD122n2Ql/BD5fUMDi5du5MTKqwzgpyeTpNVNY8rdt5NQkOAeQ/C8idYYHau
	rk5IPVh1x9az4do+Qa0zyTfNx5MsBEFKWyW2/6TH9iJ/QrlwRT94337vL3vGD6W1GPFkkEpPi8xH2
	Kp4sdz8bVczBL8Iv8gHYdKCqL0v0rkuA3fG96mRuXh96BRny6U9X1jWnhEVTTWn85wXqPRJFoxR2R
	oYCkM74XWWI0hF8QGjBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8CQ-000000046q6-37QS;
	Mon, 15 Sep 2025 12:20:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8CP-000000046nr-1XeY;
	Mon, 15 Sep 2025 12:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=F10Z0OsYT+kNHV3Z5mbBWTZLBFcFmmcfUW5nyLJWgQ4=; b=RnduAI75142f+Y8DCT+iFnJb1A
	/OqC73hNz1xc0/7aITaB+VuoUJOQiaW7TN+5RTnBYaNZU/dHRTw9F8ou8lUV7uj7bBmViC77cUsHn
	K2GrSNUfeH88NSgzOPEeGmx8JLkgWkBqh9wnDy+fxptIeRZmlBpe/jkfqBnyOGU5O/SVKVUxYUtxH
	NusNGhV9o48BtP9QP+atGWvhBiASVrwWJexaDwSMQyt7T06JWWOsKF8w+HbJB0Kvcb/q4G9UhRerF
	u6gNyF4Tw+cmoipYF8ekK7lamspp4mrtzf6KTPlqRBum8QXkQNfu6bFfFQ9GkcxvMYbLiTXzYj6fJ
	3M8DGP0g==;
Received: from pegase2.c-s.fr ([93.17.235.10])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8CL-00000006yZC-3ShH;
	Mon, 15 Sep 2025 12:20:48 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cQNbF5mghz9t06;
	Mon, 15 Sep 2025 13:48:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lGkOMbzCsqbk; Mon, 15 Sep 2025 13:48:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cQNbD4NF4z9t02;
	Mon, 15 Sep 2025 13:48:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 63D1F8B766;
	Mon, 15 Sep 2025 13:48:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id OqxzzIPrAedJ; Mon, 15 Sep 2025 13:48:40 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B11BF8B763;
	Mon, 15 Sep 2025 13:48:39 +0200 (CEST)
Message-ID: <2757ca88-5841-4024-932e-637130ac6b0b@csgroup.eu>
Date: Mon, 15 Sep 2025 13:48:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 16/62] brd: remove "ramdisk_size" command line
 parameter
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
 <20250913003842.41944-17-safinaskar@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250913003842.41944-17-safinaskar@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_132046_083259_9E1111ED 
X-CRM114-Status: GOOD (  24.10  )
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
YS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQo+IAo+IEl0IHdhcyB1c2VkIG1v
c3RseSBmb3IgaW5pdHJkLiBJdCBjb3VsZCBiZSB1c2VkIG9ubHkgaWYKPiBicmQgaXMgYnVpbHQt
aW4uIFVzZSAiYnJkLnJkX3NpemUiIGluc3RlYWQKCkZvciBtZSBpdCB3b3VsZCBtYWtlIG1vcmUg
c2Vuc2UgdG8gcmVtb3ZlIHJhbWRpc2tfc3RhcnQgYW5kIHJhbWRpc2tfc2l6ZSAKYXQgdGhlIHNh
bWUgdGltZS4KCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFza2FyIFNhZmluIDxzYWZpbmFza2FyQGdt
YWlsLmNvbT4KPiAtLS0KPiAgIC4uLi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQg
ICAgICAgICB8ICAzIC0tLQo+ICAgRG9jdW1lbnRhdGlvbi9hcmNoL202OGsva2VybmVsLW9wdGlv
bnMucnN0ICAgIHwgMjAgKystLS0tLS0tLS0tLS0tLS0tLQo+ICAgYXJjaC9hcm0vY29uZmlncy9z
M2M2NDAwX2RlZmNvbmZpZyAgICAgICAgICAgIHwgIDIgKy0KPiAgIGRyaXZlcnMvYmxvY2svYnJk
LmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEwIC0tLS0tLS0tLS0KPiAgIDQgZmlsZXMg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgYi9Eb2N1
bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAo+IGluZGV4IGFkNTJl
M2QyNjAxNC4uZTg2MmE3YjFkMmVjIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4t
Z3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1n
dWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKPiBAQCAtNTI3OSw5ICs1Mjc5LDYgQEAKPiAgICAg
ICAgICByYWlkPSAgICAgICAgICAgW0hXLFJBSURdCj4gICAgICAgICAgICAgICAgICAgICAgICAg
IFNlZSBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL21kLnJzdC4KPiAKPiAtICAgICAgIHJhbWRp
c2tfc2l6ZT0gICBbUkFNXSBTaXplcyBvZiBSQU0gZGlza3MgaW4ga2lsb2J5dGVzCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgU2VlIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvYmxvY2tkZXYv
cmFtZGlzay5yc3QuCj4gLQo+ICAgICAgICAgIHJhbmRvbS50cnVzdF9jcHU9b2ZmCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgIFtLTkwsRUFSTFldIERpc2FibGUgdHJ1c3RpbmcgdGhlIHVzZSBv
ZiB0aGUgQ1BVJ3MKPiAgICAgICAgICAgICAgICAgICAgICAgICAgcmFuZG9tIG51bWJlciBnZW5l
cmF0b3IgKGlmIGF2YWlsYWJsZSkgdG8KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hcmNo
L202OGsva2VybmVsLW9wdGlvbnMucnN0IGIvRG9jdW1lbnRhdGlvbi9hcmNoL202OGsva2VybmVs
LW9wdGlvbnMucnN0Cj4gaW5kZXggMjAwOGEyMGI0MzI5Li5mNjQ2OWViZWIyYzcgMTAwNjQ0Cj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNoL202OGsva2VybmVsLW9wdGlvbnMucnN0Cj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9hcmNoL202OGsva2VybmVsLW9wdGlvbnMucnN0Cj4gQEAgLTIxNSwyNyAr
MjE1LDExIEBAIERldmljZXMgcG9zc2libGUgZm9yIEF0YXJpOgo+ICAgICAgICAgICAgICBzZWNv
bmRzLgo+IAo+IAo+IC0yLjYpIHJhbWRpc2tfc2l6ZT0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tCj4g
LQo+IC06U3ludGF4OiByYW1kaXNrX3NpemU9PHNpemU+Cj4gLQo+IC1UaGlzIG9wdGlvbiBpbnN0
cnVjdHMgdGhlIGtlcm5lbCB0byBzZXQgdXAgYSByYW1kaXNrIG9mIHRoZSBnaXZlbgo+IC1zaXpl
IGluIEtCeXRlcy4gRG8gbm90IHVzZSB0aGlzIG9wdGlvbiBpZiB0aGUgcmFtZGlzayBjb250ZW50
cyBhcmUKPiAtcGFzc2VkIGJ5IGJvb3RzdHJhcCEgSW4gdGhpcyBjYXNlLCB0aGUgc2l6ZSBpcyBz
ZWxlY3RlZCBhdXRvbWF0aWNhbGx5Cj4gLWFuZCBzaG91bGQgbm90IGJlIG92ZXJ3cml0dGVuLgo+
IC0KPiAtVGhlIG9ubHkgYXBwbGljYXRpb24gaXMgZm9yIHJvb3QgZmlsZXN5c3RlbXMgb24gZmxv
cHB5IGRpc2tzLCB0aGF0Cj4gLXNob3VsZCBiZSBsb2FkZWQgaW50byBtZW1vcnkuIFRvIGRvIHRo
YXQsIHNlbGVjdCB0aGUgY29ycmVzcG9uZGluZwo+IC1zaXplIG9mIHRoZSBkaXNrIGFzIHJhbWRp
c2sgc2l6ZSwgYW5kIHNldCB0aGUgcm9vdCBkZXZpY2UgdG8gdGhlIGRpc2sKPiAtZHJpdmUgKHdp
dGggInJvb3Q9IikuCj4gLQo+IC0KPiAtMi43KSBzd2FwPQo+ICsyLjUpIHN3YXA9Cj4gCj4gICAg
IEkgY2FuJ3QgZmluZCBhbnkgc2lnbiBvZiB0aGlzIG9wdGlvbiBpbiAyLjIuNi4KPiAKPiAtMi44
KSBidWZmPQo+ICsyLjYpIGJ1ZmY9Cj4gICAtLS0tLS0tLS0tLQo+IAo+ICAgICBJIGNhbid0IGZp
bmQgYW55IHNpZ24gb2YgdGhpcyBvcHRpb24gaW4gMi4yLjYuCj4gZGlmZiAtLWdpdCBhL2FyY2gv
YXJtL2NvbmZpZ3MvczNjNjQwMF9kZWZjb25maWcgYi9hcmNoL2FybS9jb25maWdzL3MzYzY0MDBf
ZGVmY29uZmlnCj4gaW5kZXggYTM3ZTZhYzQwODI1Li4yMzYzNWQ1YjkzMjIgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9hcm0vY29uZmlncy9zM2M2NDAwX2RlZmNvbmZpZwo+ICsrKyBiL2FyY2gvYXJtL2Nv
bmZpZ3MvczNjNjQwMF9kZWZjb25maWcKPiBAQCAtNCw3ICs0LDcgQEAgQ09ORklHX0FSQ0hfTVVM
VElfVjY9eQo+ICAgIyBDT05GSUdfQVJDSF9NVUxUSV9WNyBpcyBub3Qgc2V0Cj4gICBDT05GSUdf
QVJDSF9TM0M2NFhYPXkKPiAgIENPTkZJR19NQUNIX1dMRl9DUkFHR182NDEwPXkKPiAtQ09ORklH
X0NNRExJTkU9ImNvbnNvbGU9dHR5U0FDMCwxMTUyMDAgcm9vdD0vZGV2L3JhbSBpbml0PS9saW51
eHJjIGluaXRyZD0weDUxMDAwMDAwLDZNIHJhbWRpc2tfc2l6ZT02MTQ0Igo+ICtDT05GSUdfQ01E
TElORT0iY29uc29sZT10dHlTQUMwLDExNTIwMCByb290PS9kZXYvcmFtIGluaXQ9L2xpbnV4cmMg
aW5pdHJkPTB4NTEwMDAwMDAsNk0iCj4gICBDT05GSUdfVkZQPXkKPiAgIENPTkZJR19NT0RVTEVT
PXkKPiAgIENPTkZJR19NT0RVTEVfVU5MT0FEPXkKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9j
ay9icmQuYyBiL2RyaXZlcnMvYmxvY2svYnJkLmMKPiBpbmRleCA3MmYwMmQyYjhhOTkuLjA1YzQz
MjU5MDRkMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Jsb2NrL2JyZC5jCj4gKysrIGIvZHJpdmVy
cy9ibG9jay9icmQuYwo+IEBAIC0yMjIsMTYgKzIyMiw2IEBAIE1PRFVMRV9MSUNFTlNFKCJHUEwi
KTsKPiAgIE1PRFVMRV9BTElBU19CTE9DS0RFVl9NQUpPUihSQU1ESVNLX01BSk9SKTsKPiAgIE1P
RFVMRV9BTElBUygicmQiKTsKPiAKPiAtI2lmbmRlZiBNT0RVTEUKPiAtLyogTGVnYWN5IGJvb3Qg
b3B0aW9ucyAtIG5vbm1vZHVsYXIgKi8KPiAtc3RhdGljIGludCBfX2luaXQgcmFtZGlza19zaXpl
KGNoYXIgKnN0cikKPiAtewo+IC0gICAgICAgcmRfc2l6ZSA9IHNpbXBsZV9zdHJ0b2woc3RyLCBO
VUxMLCAwKTsKPiAtICAgICAgIHJldHVybiAxOwo+IC19Cj4gLV9fc2V0dXAoInJhbWRpc2tfc2l6
ZT0iLCByYW1kaXNrX3NpemUpOwo+IC0jZW5kaWYKPiAtCj4gICAvKgo+ICAgICogVGhlIGRldmlj
ZSBzY2hlbWUgaXMgZGVyaXZlZCBmcm9tIGxvb3AuYy4gS2VlcCB0aGVtIGluIHN5bmNoIHdoZXJl
IHBvc3NpYmxlCj4gICAgKiAoc2hvdWxkIHNoYXJlIGNvZGUgZXZlbnR1YWxseSkuCj4gLS0KPiAy
LjQ3LjIKPiAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXNucHMtYXJjCg==
