Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095F8C678D4
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Mar 2023 13:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXhsiiOAozVOe1Vjxpiz6vmdxOAsWcUMh8/qsPmlkkE=; b=tgRMxbsKBw/O/VxHD7drNgBW9J
	8bvhWrL6Y6A3zYJUJHTM0Ihia+ixKNkVMhB5wn2vCFb/h/Xe7voV3TW2+JC29Xi2Wcj66feJiboG/
	5lQKRZZ3DoGLVbT1AluOcjconR72/Dm55yUP1aeGR6xWHCy/I6UyRLcQTvuUW8Wm8B4DuI5Rj4fy3
	iTiq9cTDtElPC4HC1d1xeRWzUDHA3wcGRgaAUfyCmpJ8kcihotbO4YD71zJv1VaiqR0AFziYLeMOa
	Kw5SihbwXjOhA2FfuKTp9yCONK/1qJrbRzGyNWOBre7udZEVYswngOB7w4HGNIFU1mBUtVrxM6NRp
	O/0fzw1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZAkS-00Cr5Q-4H; Mon, 06 Mar 2023 13:19:31 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZAkN-00Cr4O-Gp
	for linux-snps-arc@lists.infradead.org; Mon, 06 Mar 2023 13:19:26 +0000
Received: by mail-wm1-x329.google.com with SMTP id ay29-20020a05600c1e1d00b003e9f4c2b623so8155799wmb.3
        for <linux-snps-arc@lists.infradead.org>; Mon, 06 Mar 2023 05:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678108760;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vrJgxYarH7I6tNp9lZXR/Ac4rjm0j3spQFQq/MBh93Y=;
        b=jHFLuIxja1G7FgaKieMDho79j97bJcJzl5r6JSUNDsV4mA/2T7Rt4dEtFe+mJ68fX4
         BeL12/7YXldN+W+jMsW2lzMpm7r3Yib7HB15R0q1heNbBxPxEhqAIyFb3CQ8yqwvxO6o
         BJurB4kLXa0lNndbLzZFaNMuolqgLqLKrQAR20V3xF0z74ogRkWYyf9Fn6yc2fhFf5Yt
         FkCUzXT6yQqa29dR6x7uYhnNqncplW9W2fbLvSLNfHc7S5X+e6Ao0YebH65T7dKnNa3q
         Jy+sBKs6+/mTsBRIAlMv1Y4l4Lt9r2RJbnY6D7RgudRSTAB6XHrXBh5KlORUW46XFdOz
         u/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678108760;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vrJgxYarH7I6tNp9lZXR/Ac4rjm0j3spQFQq/MBh93Y=;
        b=gEnO7oenDEZJ8FZ0VK8CGyBDkalv5On4S9kHgeMQhtXay6b0u/4eixZIK7J/dAKPDI
         MrdQcsts6RF91RbAwFzrumtH66tzs9lLwciFyloRdPKSUlTeVVZ1z7q6XQ74Y+9qqMYX
         aL4pPhuu8g3xW32ZmP1bPuG9FI9iYncLOWLfDnDOp1pyLa7T7mOGHofoIiIaXB74St9o
         e7AV12SkmB0/M5YsXcLpGwnGyplDjFKQP6UWz5EYnoZcjECivgjf9Rh64NRmIPJvqCk6
         LTwBFq1+p6RmfTt5Ji1sX0c1HCFwrq2v+IhO2brwCNxrrLbXd8yJ0Qb4Ry6eM/6n/rJt
         t2PA==
X-Gm-Message-State: AO0yUKWMPpYhT2ixliOv68QOtnerdOh9xP4uvv4sjkPgFzXX7hOvLWa0
	EP72NbJRSnJcGBeXa5wzQZZgxg==
X-Google-Smtp-Source: AK7set/GCxEC4IkWKnP9EDEQUMxesVbqKr+YvF+/CM/XdLiZbcIHy+xB1RCNFt5QnRqORoMSq/nNOw==
X-Received: by 2002:a05:600c:1548:b0:3e2:1f00:bff7 with SMTP id f8-20020a05600c154800b003e21f00bff7mr7424203wmg.12.1678108760216;
        Mon, 06 Mar 2023 05:19:20 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id f21-20020a1c6a15000000b003e733a973d2sm13613044wmc.39.2023.03.06.05.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 05:19:19 -0800 (PST)
Message-ID: <e1fa23ff-951e-176b-1a84-cbaab34ed44d@linaro.org>
Date: Mon, 6 Mar 2023 14:19:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v5 00/26] Remove COMMAND_LINE_SIZE from uapi
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
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
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_051923_583519_2E1BA116 
X-CRM114-Status: GOOD (  20.84  )
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

T24gNi8zLzIzIDExOjA0LCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gVGhpcyBhbGwgY2FtZSB1
cCBpbiB0aGUgY29udGV4dCBvZiBpbmNyZWFzaW5nIENPTU1BTkRfTElORV9TSVpFIGluIHRoZQo+
IFJJU0MtViBwb3J0LiAgSW4gdGhlb3J5IHRoYXQncyBhIFVBQkkgYnJlYWssIGFzIENPTU1BTkRf
TElORV9TSVpFIGlzIHRoZQo+IG1heGltdW0gbGVuZ3RoIG9mIC9wcm9jL2NtZGxpbmUgYW5kIHVz
ZXJzcGFjZSBjb3VsZCBzdGF0aWNseSByZWx5IG9uCj4gdGhhdCB0byBiZSBjb3JyZWN0Lgo+IAo+
IFVzdWFsbHkgSSB3b3VsZG4ndCBtZXNzIGFyb3VuZCB3aXRoIGNoYW5naW5nIHRoaXMgc29ydCBv
ZiB0aGluZywgYnV0Cj4gUG93ZXJQQyBpbmNyZWFzZWQgaXQgd2l0aCBhNTk4MGQwNjRmZTIgKCJw
b3dlcnBjOiBCdW1wIENPTU1BTkRfTElORV9TSVpFCj4gdG8gMjA0OCIpLiAgVGhlcmUgYXJlIGFs
c28gYSBoYW5kZnVsIG9mIGV4YW1wbGVzIG9mIENPTU1BTkRfTElORV9TSVpFCj4gaW5jcmVhc2lu
ZywgYnV0IHRoZXkncmUgZnJvbSBiZWZvcmUgdGhlIFVBUEkgc3BsaXQgc28gSSdtIG5vdCBxdWl0
ZSBzdXJlCj4gd2hhdCB0aGF0IG1lYW5zOiBlNWE2YTFjOTA5NDggKCJwb3dlcnBjOiBkZXJpdmUg
Q09NTUFORF9MSU5FX1NJWkUgZnJvbQo+IGFzbS1nZW5lcmljIiksIDY4NGQyZmQ0OGU3MSAoIltT
MzkwXSBrZXJuZWw6IEFwcGVuZCBzY3BkYXRhIHRvIGtlcm5lbAo+IGJvb3QgY29tbWFuZCBsaW5l
IiksIDIyMjQyNjgxY2ZmNSAoIk1JUFM6IEV4dGVuZCBDT01NQU5EX0xJTkVfU0laRSIpLAo+IGFu
ZCAyYjc0Yjg1NjkzYzcgKCJzaDogRGVyaXZlIENPTU1BTkRfTElORV9TSVpFIGZyb20KPiBhc20t
Z2VuZXJpYy9zZXR1cC5oLiIpLgo+IAo+IEl0IHNlZW1zIHRvIG1lIGxpa2UgQ09NTUFORF9MSU5F
X1NJWkUgcmVhbGx5IGp1c3Qgc2hvdWxkbid0IGhhdmUgYmVlbgo+IHBhcnQgb2YgdGhlIHVhcGkg
dG8gYmVnaW4gd2l0aCwgYW5kIHVzZXJzcGFjZSBzaG91bGQgYmUgYWJsZSB0byBoYW5kbGUKPiAv
cHJvYy9jbWRsaW5lIG9mIHdoYXRldmVyIGxlbmd0aCBpdCB0dXJucyBvdXQgdG8gYmUuICBJIGRv
bid0IHNlZSBhbnkKPiByZWZlcmVuY2VzIHRvIENPTU1BTkRfTElORV9TSVpFIGFueXdoZXJlIGJ1
dCBMaW51eCB2aWEgYSBxdWljayBHb29nbGUKPiBzZWFyY2gsIGJ1dCB0aGF0J3Mgbm90IHJlYWxs
eSBlbm91Z2ggdG8gY29uc2lkZXIgaXQgdW51c2VkIG9uIG15IGVuZC4KPiAKPiBUaGlzIGlzc3Vl
IHdhcyBhbHJlYWR5IGNvbnNpZGVyZWQgaW4gczM5MCBhbmQgdGhleSByZWFjaGVkIHRoZSBzYW1l
Cj4gY29uY2x1c2lvbiBpbiBjb21taXQgNjIyMDIxY2Q2YzU2ICgiczM5MDogbWFrZSBjb21tYW5k
IGxpbmUKPiBjb25maWd1cmFibGUiKS4KPiAKPiBUaGUgZmVlZGJhY2sgb24gdGhlIHYxIHNlZW1l
ZCB0byBpbmRpY2F0ZSB0aGF0IENPTU1BTkRfTElORV9TSVpFIHJlYWxseQo+IHNob3VsZG4ndCBi
ZSBwYXJ0IG9mIHVhcGksIHNvIHRoaXMgbm93IHRvdWNoZXMgYWxsIHRoZSBwb3J0cy4gIEkndmUK
PiB0cmllZCB0byBzcGxpdCB0aGlzIGFsbCBvdXQgYW5kIGxlYXZlIGl0IGJpc2VjdGFibGUsIGJ1
dCBJIGhhdmVuJ3QKPiB0ZXN0ZWQgaXQgYWxsIHRoYXQgYWdncmVzc2l2ZWx5LgoKU2VyaWVzOgpS
ZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNu
cHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
