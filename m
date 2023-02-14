Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C16C61DA4
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Feb 2023 09:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I/U2MBj28Laz/Au6M44LBxpj0/7xWT/bJv0pK1sEus0=; b=0xeq/xIvLOIHQ0
	oJygooMgbDlBlTQY2A1Ay1VSD/Iaj/87zjyV6vNFYf2KdVWBw85XLriGnUBJ2HWljetmqi0VJH9zJ
	KxFZbEdVpmzN/C4U/xkaMKHe+Fxw+zy1jkAnok38qv8z2OYkz0k2QQuYl/dfC8Juv+VGXIqeUoSLf
	WBO0cYsuBHxtM3geVjiCklQKW2O0sJqzcQPZO16pnm5Cr7n/TAWlnrKfRGHG1kPi3sMcJbuWrpEKY
	Q05svoCzXEX3BIEWnxLmFk1w0FYYeaMA93DwnudbHmqad51b0c9o0td5akrEYxPdfDy70xURHPK5E
	Vp63CiicKrkBbIieAtVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrsC-000mQS-7o; Tue, 14 Feb 2023 09:45:16 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrs8-000mNf-JR; Tue, 14 Feb 2023 09:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1676367828; bh=bQoG1+qM5Y71xKKNzZAaZKaP54c9/SNL37IJdDcFtMo=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hihBALAdzJyyuZETKMDTwWBNqyHXT30m1W4+AhNia2aTQ0LGuEudgVjxHBOHc2O/1
	 UjuZRvBAir2lTKIaMXuW6l0Jw91yPNhbGpel182Mf/orVb0S6hbISDciYTF54Wy0Zw
	 wKM8GKPXEv0aT0K01aIbMc2I219r5PhnIgwwHqOrDmQNcp8nxxBkNf4BBrtdpN/N7Z
	 59rGu8CnZqH+X/PEx5ZjDiRwnWNihqf8TyIZs4ozwDLocxhsUitLIrPfomEmdZ19Fu
	 jPeCxrDIg0fC138zUyXarDYIQDPoI7A4vyTzEHVqChiz/r0Bk56Uo8AseQSt7S8yL1
	 B3Eipy4Ux8oWA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.155.167]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mo6qp-1olPAN2FEh-00pbOn; Tue, 14
 Feb 2023 10:43:48 +0100
Message-ID: <dd3f45ec-9578-420b-f1b8-5657fe4d3243@gmx.de>
Date: Tue, 14 Feb 2023 10:43:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 08/24] parisc: Remove COMMAND_LINE_SIZE from uapi
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S . Miller" <davem@davemloft.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-9-alexghiti@rivosinc.com>
 <f327ff48-cd50-4caa-1bea-f9906994e998@linaro.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <f327ff48-cd50-4caa-1bea-f9906994e998@linaro.org>
X-Provags-ID: V03:K1:9Li8qIWZi+mvM820GG2clzFMNjBrqaWKtjHwHuJ3DICcz81Fm4U
 2RmO3PI+i3+wTXVGnrbheX/pLAWTgvn/yTBVQw0fLroxnm5K1IoQdsZqRZENGN3ATbehT4q
 LYJbtkfgHvqXKQS4gXQhgNMMzAzKtJiyxwXWla7+a/b/HmF4fSRj8M4VAnavnpLBfZrNVAE
 KFiLIhh+7vq2/cG5n7DgQ==
UI-OutboundReport: notjunk:1;M01:P0:IMRPuKVDPJE=;F//SqmPJNB5y4+cZpiTQkcdojtN
 LJal9PAv1QZdKB5D9CqOG4kDONZWyrNPKkN5b2mOfjhxupMdRrK75ginsDTsmoS6GxkXsawSe
 Ixb8/z/qWuT1XvHLvnObIyu9+CDwBFSLnvfS3oUCwO+McbEoaOIu3JOluz1CKIea/++hZAXXr
 5C/TDqeO2eW5Jj3zZR6/N6R7AbpRepoOcQKEjh1MMZly5ruuMMBXB13XwuZnCOPKbuWQD+P7U
 u5tjrVNOGUNXNhr0d3ai5DZSZ1P8Nv1752gGfUFNLirvADBmHUDdcgrG+Gm61GdfigPYbqqb/
 1PkUPKxRFBpZ1Cx4NSNOEnyeyZwSSXJKUgjkOkH22I1GXJ97YYM62oMo0vh5OYLWx0+hsk/8n
 HQhgMxbA10mk0n61Oj1blXGd+3vMYjFQuoEHgmidB0ldTYGVNyoXaO/SaCdFfxjJsn59BdGTL
 BZkhFpt3GJCd/AnG1wSvWUqOtXgAztE05KU+svPlIGXtnFeCOF2OU2N0ju8TFPdKrWa9brAZn
 sGjDk9UmZcbxwEt172brI7gtjbfvg29z7hHouTLGUEF9EqngZWh7EYp7gkVmQI/hozbgBsgoz
 eeLkzBY9tFrPxWifcvWfEMtpsICAIZXlFRN9dU+6mSkBeP0uz+co3OyUT2lGEettUPgMaBMWt
 hOeJ6wwHJ9pcHumJqm8AgV1qyLG95d6wlp0B94e3M4XQozlyXIMUOfx6LF870WFYysGHABOcC
 oOK9ypcj7sSBG/v7UPkRI/eACrxmZcVd3CnqbnnNKSbQk5qLhC+LBre/2RfSAQNenKWKT/xM6
 x2YRcaR4vPXIiPvzgV67iGQiTV1DY0D+hOgX7A2y/rweS243V0Bg1zHwIp9mRRsPiVM9+jgWo
 5yCcZvbHQGpOV5nnMvCxSj7isEJhJpd8xyktSgL+sUclmpfCvHbx8GkA7VJGN8RClkxcIL70E
 lxVNlTmcU+VpaSQbimIQeIbIpXk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_014512_971112_14FB38D6 
X-CRM114-Status: GOOD (  11.62  )
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

T24gMi8xNC8yMyAxMDowOCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6Cj4gT24gMTQv
Mi8yMyAwODo0OSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+PiBGcm9tOiBQYWxtZXIgRGFiYmVs
dCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPj4KPj4gQXMgZmFyIGFzIEkgY2FuIHRlbGwgdGhpcyBp
cyBub3QgdXNlZCBieSB1c2Vyc3BhY2UgYW5kIHRodXMgc2hvdWxkIG5vdAo+PiBiZSBwYXJ0IG9m
IHRoZSB1c2VyLXZpc2libGUgQVBJLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVs
dCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPj4gLS0tCj4+IMKgIGFyY2gvcGFyaXNjL2luY2x1ZGUv
YXNtL3NldHVwLmjCoMKgwqDCoMKgIHwgNyArKysrKysrCj4+IMKgIGFyY2gvcGFyaXNjL2luY2x1
ZGUvdWFwaS9hc20vc2V0dXAuaCB8IDIgLS0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Bh
cmlzYy9pbmNsdWRlL2FzbS9zZXR1cC5oCj4KPiBSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgoKQWNrZWQtYnk6IEhlbGdlIERlbGxlciA8ZGVs
bGVyQGdteC5kZT4KCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtc25wcy1hcmMK
