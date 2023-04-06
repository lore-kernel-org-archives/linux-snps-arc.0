Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06721C76196
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 Apr 2023 12:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=luFYfQ2khtXVF6SK/Y8hdJNRBcuxjxKt8uahZr4ktn4=; b=cF5cDCxLaA5x64
	YU/MgJN3P5UnijIgdz+sGWrchEnj0Exsxejwjk5gGx0BeVyHdGLU7OKkyg51j9LdC4YkgZnr5R2/y
	7GNgU6a7NC1eSaiykF/H5MwztlzrHEtbjg1kXGKqNWB9mSKpBYTYjOdnPqMp93ixDq2DLMuhKjVtK
	HUOWtoCaKZsx+Xk4NOXQ2ghoGvAOaRElcK2SjclQbvZVwrfIXYMXEwwsKg4vnyQGLoVsQC0vVbkfD
	H/5UC59fwcvn6CcYh246+tB241hXRT4rVVNQZADqtWx+rwyNn2FWxePTuR98I5wiIi9kBLJTbd7Bv
	X45fN78k3zMB+OGVm8dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkPAV-007L8W-1p;
	Thu, 06 Apr 2023 12:56:47 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkPAS-007L6V-1Y
	for linux-snps-arc@lists.infradead.org;
	Thu, 06 Apr 2023 12:56:46 +0000
Received: from [192.168.10.39] (unknown [119.155.57.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 72F7E66031C4;
	Thu,  6 Apr 2023 13:56:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680785800;
	bh=d7JTiy8ovEYbUFvC01n8kek6TmFeDzGhkMljOTLpJHE=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=jaT3gs+CNogKiSvW5uwVuaK6YiAzYBvKUs/sUBVhDgiLgDZOC8cHm4erIIWn4IL6L
	 KtTqzU1wWqChhoZV8T97s/+b7wW1UEEs6YuVnvVmpNYXBz3LkaAe0cTqmXe1gSPnsy
	 quVXl3rZ5E2S3d5G1zqwsP6A31mEQtcH0BpwNpeO739+mkRTz7P3XCgo0fSHR7IM8t
	 oL1XyyuqjGsnVOqIHrluQMW95YTwklyWmIMY0tZQ/vgwj4+IUqDFc57Ba8Ly89CGOp
	 qEqrM0vd8TZFKcSE9ROdN2OlymtPjPpR1Ep1hXPm8aChNVoXAUe/4IaR47/LUeYkci
	 hqJe5c5bhNOwg==
Message-ID: <e3c82373-256a-6297-bcb4-5e1179a2cbe2@collabora.com>
Date: Thu, 6 Apr 2023 17:56:29 +0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Christian Brauner <brauner@kernel.org>, Yang Shi <shy828301@gmail.com>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Yun Zhou <yun.zhou@windriver.com>,
 Suren Baghdasaryan <surenb@google.com>, Alex Sierra <alex.sierra@amd.com>,
 Matthew Wilcox <willy@infradead.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Axel Rasmussen <axelrasmussen@google.com>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Greg KH <greg@kroah.com>
Subject: Re: [PATCH v12 2/5] fs/proc/task_mmu: Implement IOCTL to get and
 optionally clear info about PTEs
To: kernel test robot <lkp@intel.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WC?=
 =?UTF-8?Q?aw?= <emmir@google.com>, Andrei Vagin <avagin@gmail.com>,
 Danylo Mocherniuk <mdanylo@google.com>, Paul Gofman
 <pgofman@codeweavers.com>, Cyrill Gorcunov <gorcunov@gmail.com>,
 Mike Rapoport <rppt@kernel.org>, Nadav Amit <namit@vmware.com>,
 Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org
References: <20230406074005.1784728-3-usama.anjum@collabora.com>
 <202304061914.N1Hmx12N-lkp@intel.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <202304061914.N1Hmx12N-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_055644_780852_87D5DFA3 
X-CRM114-Status: GOOD (  16.75  )
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

T24gNC82LzIzIDQ6NDDigK9QTSwga2VybmVsIHRlc3Qgcm9ib3Qgd3JvdGU6Cj4gSGkgTXVoYW1t
YWQsCj4gCj4ga2VybmVsIHRlc3Qgcm9ib3Qgbm90aWNlZCB0aGUgZm9sbG93aW5nIGJ1aWxkIGVy
cm9yczoKPiAKPiBbYXV0byBidWlsZCB0ZXN0IEVSUk9SIG9uIGFrcG0tbW0vbW0tZXZlcnl0aGlu
Z10KPiBbYWxzbyBidWlsZCB0ZXN0IEVSUk9SIG9uIG5leHQtMjAyMzA0MDZdCj4gW2Nhbm5vdCBh
cHBseSB0byBsaW51cy9tYXN0ZXIgdjYuMy1yYzVdCj4gW0lmIHlvdXIgcGF0Y2ggaXMgYXBwbGll
ZCB0byB0aGUgd3JvbmcgZ2l0IHRyZWUsIGtpbmRseSBkcm9wIHVzIGEgbm90ZS4KPiBBbmQgd2hl
biBzdWJtaXR0aW5nIHBhdGNoLCB3ZSBzdWdnZXN0IHRvIHVzZSAnLS1iYXNlJyBhcyBkb2N1bWVu
dGVkIGluCj4gaHR0cHM6Ly9naXQtc2NtLmNvbS9kb2NzL2dpdC1mb3JtYXQtcGF0Y2gjX2Jhc2Vf
dHJlZV9pbmZvcm1hdGlvbl0KPiAKPiB1cmw6ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC1s
YWItbGtwL2xpbnV4L2NvbW1pdHMvTXVoYW1tYWQtVXNhbWEtQW5qdW0vdXNlcmZhdWx0ZmQtVUZG
RF9GRUFUVVJFX1dQX0FTWU5DLzIwMjMwNDA2LTE1NDMxNAo+IGJhc2U6ICAgaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYWtwbS9tbS5naXQgbW0tZXZlcnl0
aGluZwo+IHBhdGNoIGxpbms6ICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMzA0MDYw
NzQwMDUuMTc4NDcyOC0zLXVzYW1hLmFuanVtJTQwY29sbGFib3JhLmNvbQo+IHBhdGNoIHN1Ympl
Y3Q6IFtQQVRDSCB2MTIgMi81XSBmcy9wcm9jL3Rhc2tfbW11OiBJbXBsZW1lbnQgSU9DVEwgdG8g
Z2V0IGFuZCBvcHRpb25hbGx5IGNsZWFyIGluZm8gYWJvdXQgUFRFcwo+IGNvbmZpZzogYXJjLXJh
bmRjb25maWctcjAyMy0yMDIzMDQwNSAoaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9h
cmNoaXZlLzIwMjMwNDA2LzIwMjMwNDA2MTkxNC5OMUhteDEyTi1sa3BAaW50ZWwuY29tL2NvbmZp
ZykKPiBjb21waWxlcjogYXJjZWItZWxmLWdjYyAoR0NDKSAxMi4xLjAKPiByZXByb2R1Y2UgKHRo
aXMgaXMgYSBXPTEgYnVpbGQpOgo+ICAgICAgICAgd2dldCBodHRwczovL3Jhdy5naXRodWJ1c2Vy
Y29udGVudC5jb20vaW50ZWwvbGtwLXRlc3RzL21hc3Rlci9zYmluL21ha2UuY3Jvc3MgLU8gfi9i
aW4vbWFrZS5jcm9zcwo+ICAgICAgICAgY2htb2QgK3ggfi9iaW4vbWFrZS5jcm9zcwo+ICAgICAg
ICAgIyBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwtbGFiLWxrcC9saW51eC9jb21taXQvZjEzYWJi
MzZmNjRjNzc5MTM1MDlkYThjYTE1NzUxMmQyZmI5ZjAzMQo+ICAgICAgICAgZ2l0IHJlbW90ZSBh
ZGQgbGludXgtcmV2aWV3IGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC1sYWItbGtwL2xpbnV4Cj4g
ICAgICAgICBnaXQgZmV0Y2ggLS1uby10YWdzIGxpbnV4LXJldmlldyBNdWhhbW1hZC1Vc2FtYS1B
bmp1bS91c2VyZmF1bHRmZC1VRkZEX0ZFQVRVUkVfV1BfQVNZTkMvMjAyMzA0MDYtMTU0MzE0Cj4g
ICAgICAgICBnaXQgY2hlY2tvdXQgZjEzYWJiMzZmNjRjNzc5MTM1MDlkYThjYTE1NzUxMmQyZmI5
ZjAzMQo+ICAgICAgICAgIyBzYXZlIHRoZSBjb25maWcgZmlsZQo+ICAgICAgICAgbWtkaXIgYnVp
bGRfZGlyICYmIGNwIGNvbmZpZyBidWlsZF9kaXIvLmNvbmZpZwo+ICAgICAgICAgQ09NUElMRVJf
SU5TVEFMTF9QQVRIPSRIT01FLzBkYXkgQ09NUElMRVI9Z2NjLTEyLjEuMCBtYWtlLmNyb3NzIFc9
MSBPPWJ1aWxkX2RpciBBUkNIPWFyYyBvbGRkZWZjb25maWcKPiAgICAgICAgIENPTVBJTEVSX0lO
U1RBTExfUEFUSD0kSE9NRS8wZGF5IENPTVBJTEVSPWdjYy0xMi4xLjAgbWFrZS5jcm9zcyBXPTEg
Tz1idWlsZF9kaXIgQVJDSD1hcmMgU0hFTEw9L2Jpbi9iYXNoIGZzL3Byb2MvCj4gCj4gSWYgeW91
IGZpeCB0aGUgaXNzdWUsIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZyB3aGVyZSBhcHBsaWNhYmxl
Cj4gfCBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gfCBM
aW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjMwNDA2MTkxNC5O
MUhteDEyTi1sa3BAaW50ZWwuY29tLwo+IAo+IEFsbCBlcnJvci93YXJuaW5ncyAobmV3IG9uZXMg
cHJlZml4ZWQgYnkgPj4pOgo+IAo+ICAgIGZzL3Byb2MvdGFza19tbXUuYzogSW4gZnVuY3Rpb24g
J3BhZ2VtYXBfc2Nhbl9wbWRfZW50cnknOgo+Pj4gZnMvcHJvYy90YXNrX21tdS5jOjE5MjE6Mzc6
IGVycm9yOiAnSFBBR0VfU0laRScgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rp
b24pOyBkaWQgeW91IG1lYW4gJ1BBR0VfU0laRSc/Cj4gICAgIDE5MjEgfCAgICAgICAgICAgICAg
ICAgICAgICgoZW5kIC0gc3RhcnQgPCBIUEFHRV9TSVpFKSB8fAo+ICAgICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fgo+ICAgICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUEFHRV9TSVpFCkl0IHNlZW1zIGFyYyBh
cmNoaXRlY3R1cmUgc3VwcG9ydHMgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFLCBidXQgaXQK
ZG9lc24ndCBkZWZpbmUgSFBBR0VfU0laRS4gSXQgb25seSBkZWZpbmVzIFBBR0VfU0laRSBpbgpp
bmNsdWRlL3VhcGkvYXNtL3BhZ2UuaD8gQUZBSUsgSFBBR0VfU0laRSBtdXN0IGJlIGRlZmluZWQg
d2hlbgpDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UgaXMgZW5hYmxlZC4gV2hhdCBjYW4gYmUg
dGhlIHNvbHV0aW9uIGhlcmUgZm9yIGFyYz8KClRoZSByZW1haW5pbmcgYnVpbGQgZmFpbHVyZXMg
YXJlIGJlY2F1c2UgdGhlIHdyb25nIHRyZWUuIEkgYmFzZSBteSBwYXRjaGVzCm9uIGxhdGVzdCBu
ZXh0LCB3aGlsZSB0aGUgYm90IGhhcyBiYXNlZCBwYXRjaGVzIG9uIG1tLWV2ZXJ5dGhpbmcuIEkg
Z3Vlc3MKdG9kYXkncyBuZXh0IHdvdWxkIGhhdmUgbGF0ZXN0IG1tIHN0dWZmLCBhIHJlYmFzZSB3
b3VsZCBtYWtlIHRoaW5ncyBjb3JyZWN0Cm9yIEknbGwgc2hpZnQgdG8gbW0tZXZlcnl0aGluZy4K
CgotLSAKQlIsCk11aGFtbWFkIFVzYW1hIEFuanVtCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgt
c25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
