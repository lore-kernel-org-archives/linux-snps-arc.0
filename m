Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D493AC61DA4
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Feb 2023 09:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vS8Rmw6g0ELZkXWMxr4BEufY+48GEeRPJiRtAALgnQ8=; b=Wj/iHPPRrj7Wm+eLLfaZMopaD0
	9XqiA3LbsNfK0YlpSHu/q8lNSG5zfi/Kwfes5otPENB4gEh8jIldugh28rlmHF54Tw+f8d9hqtEjn
	ARVYrBseVdOARH4EYzFgg34E4Qo7TgV6ZnVTcyVi4kqW8zSLNMu09ujbM2rT6Uzr15WIKcuFtTCuI
	XcK8eH6Ms7WK7x92DYvJDzxDW9E1L4LmJ6K3tP1RLJuRuiLDcezbKMeWSzoVoKD4vB1ognHQDcb3f
	ddxfiyWBpxUmard3mm0kvv1S5EW8hlaCFpye8TkT5iPbdtRdadxPWV9K2MAO6RTHVVM0gGaVrdHxX
	cyt/iojw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrLP-000fhJ-OL; Tue, 14 Feb 2023 09:11:23 +0000
Received: from mx01.omp.ru ([90.154.21.10])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrLL-000ffc-SY; Tue, 14 Feb 2023 09:11:21 +0000
Received: from [192.168.1.103] (31.173.81.56) by msexch01.omp.ru (10.188.4.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Tue, 14 Feb
 2023 12:11:08 +0300
Subject: Re: [PATCH v3 10/24] sparc: Remove COMMAND_LINE_SIZE from uapi
To: WANG Xuerui <kernel@xen0n.name>, Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson
	<richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell
 King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley"
	<James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
	<gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
	"David S . Miller" <davem@davemloft.net>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max
 Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-alpha@vger.kernel.org>, <linux-snps-arc@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-ia64@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linux-m68k@lists.linux-m68k.org>,
	<linux-mips@vger.kernel.org>, <linux-parisc@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
	<sparclinux@vger.kernel.org>, <linux-xtensa@linux-xtensa.org>,
	<linux-arch@vger.kernel.org>
CC: Palmer Dabbelt <palmer@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-11-alexghiti@rivosinc.com>
 <017f0b40-8021-8b3b-24d2-c70661b6b292@omp.ru>
 <f3db61bb-5c89-2724-769f-9d606f587f92@xen0n.name>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <66698133-a458-0995-f3d9-fb6cfccbd9d5@omp.ru>
Date: Tue, 14 Feb 2023 12:11:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <f3db61bb-5c89-2724-769f-9d606f587f92@xen0n.name>
Content-Language: en-US
X-Originating-IP: [31.173.81.56]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.59, Database issued on: 02/14/2023 08:47:19
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 175500 [Feb 14 2023]
X-KSE-AntiSpam-Info: Version: 5.9.59.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 504 504 dc137e1f9c062eb6c0671e7d509ab442ae395562
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.81.56 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: 	127.0.0.199:7.1.2;omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.81.56
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 02/14/2023 08:50:00
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 2/14/2023 6:26:00 AM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_011119_943217_518F3BF4 
X-CRM114-Status: GOOD (  11.75  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gMi8xNC8yMyAxMTo1OSBBTSwgV0FORyBYdWVydWkgd3JvdGU6ClsuLi5dCgo+Pj4gRnJvbTog
UGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4+Pgo+Pj4gQXMgZmFyIGFzIEkg
Y2FuIHRlbGwgdGhpcyBpcyBub3QgdXNlZCBieSB1c2Vyc3BhY2UgYW5kIHRodXMgc2hvdWxkIG5v
dAo+Pj4gYmUgcGFydCBvZiB0aGUgdXNlci12aXNpYmxlIEFQSS4KPj4+Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPj4+IC0tLQo+Pj4gwqAg
YXJjaC9zcGFyYy9pbmNsdWRlL2FzbS9zZXR1cC5owqDCoMKgwqDCoCB8IDYgKysrKystCj4+PiDC
oCBhcmNoL3NwYXJjL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaCB8IDcgLS0tLS0tLQo+Pj4gwqAg
MiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4+Pgo+Pj4g
ZGlmZiAtLWdpdCBhL2FyY2gvc3BhcmMvaW5jbHVkZS9hc20vc2V0dXAuaCBiL2FyY2gvc3BhcmMv
aW5jbHVkZS9hc20vc2V0dXAuaAo+Pj4gaW5kZXggNzIyMDU2ODRlNTFlLi5kMTM4NGVkOTI1NDcg
MTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3NwYXJjL2luY2x1ZGUvYXNtL3NldHVwLmgKPj4+ICsrKyBi
L2FyY2gvc3BhcmMvaW5jbHVkZS9hc20vc2V0dXAuaAo+Pj4gQEAgLTcsNyArNywxMSBAQAo+Pj4g
wqAgwqAgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgo+Pj4gwqAgLSNpbmNsdWRlIDx1YXBp
L2FzbS9zZXR1cC5oPgo+Pj4gKyNpZiBkZWZpbmVkKF9fc3BhcmNfXykgJiYgZGVmaW5lZChfX2Fy
Y2g2NF9fKQo+Pgo+PiDCoMKgwqAgTWhtLCBJIGRvbid0IHRoaW5rIHRoZXNlIHR3byBjYW4gYmUg
I2RlZmluZSdkIHNpbXVsYW5lb3VzbHkuLi4KPiAKPiBJIGJlbGlldmUgaXQncyBqdXN0IGEgU1BB
UkMtaXNtIFsxXSBbMl0gdGhhdCBtYXkgbG9vayBzdHJhbmdlIGFuZCBiZSBlYXNpbHkgY29uZnVz
ZWQgZm9yIF9fYWFyY2g2NF9fIChub3RpY2UgdGhlIGV4dHJhICdhJykuLi4KCiAgWWVhaCwgc29y
cnksIEkgZGlkIGNvbmZ1c2UgaXQgd2l0aCBBQXJnaDY0LiA6LSkKClsuLi5dCgpNTlIsIFNlcmdl
eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
c25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFy
Ywo=
