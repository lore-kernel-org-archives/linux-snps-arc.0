Return-Path: <SRS0=90H6=6V=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD8AC47247
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 May 2020 15:03:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86CAC2083B
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 May 2020 15:03:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T49/r/g0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86CAC2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KQ0A8EEmlbp0VjFWneS/UELZ/Lb8j7UFGn2sN75/VYU=; b=T49/r/g0GCbhQQ
	5UbM+2fbyqGEqgnDe6Zd+opaRW1aatSY7sd96N+v9LKUZH4lZidBG5x4mWpvg+53SnDuzpPu3hYOd
	RD9CB2kx8ghXtEF3GvF5pIieD235gF4prEFs0SCiotRMuIyMgTAxl7Hq9bYuh+RqqAlHL1dP+gxKJ
	cWhREX2BJ/Kgqgj0VimOQ+zqvXoMs3N8wAQzJk+TjegSMlQj/dYbidhnQahP3EmDecvWVM5mhaYMM
	PfRSfcZ3sSYsR6Z00U+CyFGet1cy49NxilJIbzvu78zb97jGUOEaie3WJiawvXzNO17yY3QHe4hgZ
	jzwFr5pH+LMfz2t3Aj3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWi3N-0007HK-Jp; Thu, 07 May 2020 15:03:13 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWi0a-0002U9-1z; Thu, 07 May 2020 15:00:27 +0000
IronPort-SDR: 5OidfqTaj/KR8+wblwxaRV7rUu2xjZ9iWx+Ja9y0+ms7oGJB9BEIRs0CPxh9phRf5zIqGILx8G
 myQsRXIsvKyA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 08:00:19 -0700
IronPort-SDR: Cy4UofL/ZGlxBiwM8d7yBPac+s1xeopmMiYRGd1bsbjvN9m3oMzJUzzLiZDzQ9TZkKicsB3vdJ
 vg2mxCRP3g1g==
X-IronPort-AV: E=Sophos;i="5.73,364,1583222400"; d="scan'208";a="296559905"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 08:00:18 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH V3 11/15] drm: Remove drm specific kmap_atomic code
Date: Thu,  7 May 2020 07:59:59 -0700
Message-Id: <20200507150004.1423069-12-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150004.1423069-1-ira.weiny@intel.com>
References: <20200507150004.1423069-1-ira.weiny@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_080020_223374_4849AF0B 
X-CRM114-Status: GOOD (  13.99  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Dan Williams <dan.j.williams@intel.com>, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

RnJvbTogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgoKa21hcF9hdG9taWNfcHJvdCgp
IGlzIG5vdyBleHBvcnRlZCBieSBhbGwgYXJjaGl0ZWN0dXJlcy4gIFVzZSB0aGlzCmZ1bmN0aW9u
IHJhdGhlciB0aGFuIG9wZW4gY29kaW5nIGEgZHJpdmVyIHNwZWNpZmljIGttYXBfYXRvbWljLgoK
QWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+ClJldmlld2Vk
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClJldmlld2Vk
LWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KU2lnbmVkLW9mZi1ieTogSXJhIFdl
aW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
X3V0aWwuYyAgICB8IDU2ICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1
L2RybS92bXdnZngvdm13Z2Z4X2JsaXQuYyB8IDE2ICsrKystLS0tCiBpbmNsdWRlL2RybS90dG0v
dHRtX2JvX2FwaS5oICAgICAgICAgfCAgNCAtLQogMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRp
b25zKCspLCA2NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9ib191dGlsLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKaW5kZXgg
NTJkMmI3MWYxNTg4Li5mMDliMDk2YmE0ZmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvX3V0aWwuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMK
QEAgLTI1Nyw1NCArMjU3LDYgQEAgc3RhdGljIGludCB0dG1fY29weV9pb19wYWdlKHZvaWQgKmRz
dCwgdm9pZCAqc3JjLCB1bnNpZ25lZCBsb25nIHBhZ2UpCiAJcmV0dXJuIDA7CiB9CiAKLSNpZmRl
ZiBDT05GSUdfWDg2Ci0jZGVmaW5lIF9fdHRtX2ttYXBfYXRvbWljX3Byb3QoX19wYWdlLCBfX3By
b3QpIGttYXBfYXRvbWljX3Byb3QoX19wYWdlLCBfX3Byb3QpCi0jZGVmaW5lIF9fdHRtX2t1bm1h
cF9hdG9taWMoX19hZGRyKSBrdW5tYXBfYXRvbWljKF9fYWRkcikKLSNlbHNlCi0jZGVmaW5lIF9f
dHRtX2ttYXBfYXRvbWljX3Byb3QoX19wYWdlLCBfX3Byb3QpIHZtYXAoJl9fcGFnZSwgMSwgMCwg
IF9fcHJvdCkKLSNkZWZpbmUgX190dG1fa3VubWFwX2F0b21pYyhfX2FkZHIpIHZ1bm1hcChfX2Fk
ZHIpCi0jZW5kaWYKLQotCi0vKioKLSAqIHR0bV9rbWFwX2F0b21pY19wcm90IC0gRWZmaWNpZW50
IGtlcm5lbCBtYXAgb2YgYSBzaW5nbGUgcGFnZSB3aXRoCi0gKiBzcGVjaWZpZWQgcGFnZSBwcm90
ZWN0aW9uLgotICoKLSAqIEBwYWdlOiBUaGUgcGFnZSB0byBtYXAuCi0gKiBAcHJvdDogVGhlIHBh
Z2UgcHJvdGVjdGlvbi4KLSAqCi0gKiBUaGlzIGZ1bmN0aW9uIG1hcHMgYSBUVE0gcGFnZSB1c2lu
ZyB0aGUga21hcF9hdG9taWMgYXBpIGlmIGF2YWlsYWJsZSwKLSAqIG90aGVyd2lzZSBmYWxscyBi
YWNrIHRvIHZtYXAuIFRoZSB1c2VyIG11c3QgbWFrZSBzdXJlIHRoYXQgdGhlCi0gKiBzcGVjaWZp
ZWQgcGFnZSBkb2VzIG5vdCBoYXZlIGFuIGFsaWFzZWQgbWFwcGluZyB3aXRoIGEgZGlmZmVyZW50
IGNhY2hpbmcKLSAqIHBvbGljeSB1bmxlc3MgdGhlIGFyY2hpdGVjdHVyZSBleHBsaWNpdGx5IGFs
bG93cyBpdC4gQWxzbyBtYXBwaW5nIGFuZAotICogdW5tYXBwaW5nIHVzaW5nIHRoaXMgYXBpIG11
c3QgYmUgY29ycmVjdGx5IG5lc3RlZC4gVW5tYXBwaW5nIHNob3VsZAotICogb2NjdXIgaW4gdGhl
IHJldmVyc2Ugb3JkZXIgb2YgbWFwcGluZy4KLSAqLwotdm9pZCAqdHRtX2ttYXBfYXRvbWljX3By
b3Qoc3RydWN0IHBhZ2UgKnBhZ2UsIHBncHJvdF90IHByb3QpCi17Ci0JaWYgKHBncHJvdF92YWwo
cHJvdCkgPT0gcGdwcm90X3ZhbChQQUdFX0tFUk5FTCkpCi0JCXJldHVybiBrbWFwX2F0b21pYyhw
YWdlKTsKLQllbHNlCi0JCXJldHVybiBfX3R0bV9rbWFwX2F0b21pY19wcm90KHBhZ2UsIHByb3Qp
OwotfQotRVhQT1JUX1NZTUJPTCh0dG1fa21hcF9hdG9taWNfcHJvdCk7Ci0KLS8qKgotICogdHRt
X2t1bm1hcF9hdG9taWNfcHJvdCAtIFVubWFwIGEgcGFnZSB0aGF0IHdhcyBtYXBwZWQgdXNpbmcK
LSAqIHR0bV9rbWFwX2F0b21pY19wcm90LgotICoKLSAqIEBhZGRyOiBUaGUgdmlydHVhbCBhZGRy
ZXNzIGZyb20gdGhlIG1hcC4KLSAqIEBwcm90OiBUaGUgcGFnZSBwcm90ZWN0aW9uLgotICovCi12
b2lkIHR0bV9rdW5tYXBfYXRvbWljX3Byb3Qodm9pZCAqYWRkciwgcGdwcm90X3QgcHJvdCkKLXsK
LQlpZiAocGdwcm90X3ZhbChwcm90KSA9PSBwZ3Byb3RfdmFsKFBBR0VfS0VSTkVMKSkKLQkJa3Vu
bWFwX2F0b21pYyhhZGRyKTsKLQllbHNlCi0JCV9fdHRtX2t1bm1hcF9hdG9taWMoYWRkcik7Ci19
Ci1FWFBPUlRfU1lNQk9MKHR0bV9rdW5tYXBfYXRvbWljX3Byb3QpOwotCiBzdGF0aWMgaW50IHR0
bV9jb3B5X2lvX3R0bV9wYWdlKHN0cnVjdCB0dG1fdHQgKnR0bSwgdm9pZCAqc3JjLAogCQkJCXVu
c2lnbmVkIGxvbmcgcGFnZSwKIAkJCQlwZ3Byb3RfdCBwcm90KQpAQCAtMzE2LDEzICsyNjgsMTMg
QEAgc3RhdGljIGludCB0dG1fY29weV9pb190dG1fcGFnZShzdHJ1Y3QgdHRtX3R0ICp0dG0sIHZv
aWQgKnNyYywKIAkJcmV0dXJuIC1FTk9NRU07CiAKIAlzcmMgPSAodm9pZCAqKSgodW5zaWduZWQg
bG9uZylzcmMgKyAocGFnZSA8PCBQQUdFX1NISUZUKSk7Ci0JZHN0ID0gdHRtX2ttYXBfYXRvbWlj
X3Byb3QoZCwgcHJvdCk7CisJZHN0ID0ga21hcF9hdG9taWNfcHJvdChkLCBwcm90KTsKIAlpZiAo
IWRzdCkKIAkJcmV0dXJuIC1FTk9NRU07CiAKIAltZW1jcHlfZnJvbWlvKGRzdCwgc3JjLCBQQUdF
X1NJWkUpOwogCi0JdHRtX2t1bm1hcF9hdG9taWNfcHJvdChkc3QsIHByb3QpOworCWt1bm1hcF9h
dG9taWMoZHN0KTsKIAogCXJldHVybiAwOwogfQpAQCAtMzM4LDEzICsyOTAsMTMgQEAgc3RhdGlj
IGludCB0dG1fY29weV90dG1faW9fcGFnZShzdHJ1Y3QgdHRtX3R0ICp0dG0sIHZvaWQgKmRzdCwK
IAkJcmV0dXJuIC1FTk9NRU07CiAKIAlkc3QgPSAodm9pZCAqKSgodW5zaWduZWQgbG9uZylkc3Qg
KyAocGFnZSA8PCBQQUdFX1NISUZUKSk7Ci0Jc3JjID0gdHRtX2ttYXBfYXRvbWljX3Byb3Qocywg
cHJvdCk7CisJc3JjID0ga21hcF9hdG9taWNfcHJvdChzLCBwcm90KTsKIAlpZiAoIXNyYykKIAkJ
cmV0dXJuIC1FTk9NRU07CiAKIAltZW1jcHlfdG9pbyhkc3QsIHNyYywgUEFHRV9TSVpFKTsKIAot
CXR0bV9rdW5tYXBfYXRvbWljX3Byb3Qoc3JjLCBwcm90KTsKKwlrdW5tYXBfYXRvbWljKHNyYyk7
CiAKIAlyZXR1cm4gMDsKIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X2JsaXQuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2JsaXQuYwppbmRleCBi
YjQ2Y2EwYzQ1OGYuLjk0ZDQ1NmExZDFhOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Zt
d2dmeC92bXdnZnhfYmxpdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Js
aXQuYwpAQCAtMzc0LDEyICszNzQsMTIgQEAgc3RhdGljIGludCB2bXdfYm9fY3B1X2JsaXRfbGlu
ZShzdHJ1Y3Qgdm13X2JvX2JsaXRfbGluZV9kYXRhICpkLAogCQljb3B5X3NpemUgPSBtaW5fdCh1
MzIsIGNvcHlfc2l6ZSwgUEFHRV9TSVpFIC0gc3JjX3BhZ2Vfb2Zmc2V0KTsKIAogCQlpZiAodW5t
YXBfc3JjKSB7Ci0JCQl0dG1fa3VubWFwX2F0b21pY19wcm90KGQtPnNyY19hZGRyLCBkLT5zcmNf
cHJvdCk7CisJCQlrdW5tYXBfYXRvbWljKGQtPnNyY19hZGRyKTsKIAkJCWQtPnNyY19hZGRyID0g
TlVMTDsKIAkJfQogCiAJCWlmICh1bm1hcF9kc3QpIHsKLQkJCXR0bV9rdW5tYXBfYXRvbWljX3By
b3QoZC0+ZHN0X2FkZHIsIGQtPmRzdF9wcm90KTsKKwkJCWt1bm1hcF9hdG9taWMoZC0+ZHN0X2Fk
ZHIpOwogCQkJZC0+ZHN0X2FkZHIgPSBOVUxMOwogCQl9CiAKQEAgLTM4OCw4ICszODgsOCBAQCBz
dGF0aWMgaW50IHZtd19ib19jcHVfYmxpdF9saW5lKHN0cnVjdCB2bXdfYm9fYmxpdF9saW5lX2Rh
dGEgKmQsCiAJCQkJcmV0dXJuIC1FSU5WQUw7CiAKIAkJCWQtPmRzdF9hZGRyID0KLQkJCQl0dG1f
a21hcF9hdG9taWNfcHJvdChkLT5kc3RfcGFnZXNbZHN0X3BhZ2VdLAotCQkJCQkJICAgICBkLT5k
c3RfcHJvdCk7CisJCQkJa21hcF9hdG9taWNfcHJvdChkLT5kc3RfcGFnZXNbZHN0X3BhZ2VdLAor
CQkJCQkJIGQtPmRzdF9wcm90KTsKIAkJCWlmICghZC0+ZHN0X2FkZHIpCiAJCQkJcmV0dXJuIC1F
Tk9NRU07CiAKQEAgLTQwMSw4ICs0MDEsOCBAQCBzdGF0aWMgaW50IHZtd19ib19jcHVfYmxpdF9s
aW5lKHN0cnVjdCB2bXdfYm9fYmxpdF9saW5lX2RhdGEgKmQsCiAJCQkJcmV0dXJuIC1FSU5WQUw7
CiAKIAkJCWQtPnNyY19hZGRyID0KLQkJCQl0dG1fa21hcF9hdG9taWNfcHJvdChkLT5zcmNfcGFn
ZXNbc3JjX3BhZ2VdLAotCQkJCQkJICAgICBkLT5zcmNfcHJvdCk7CisJCQkJa21hcF9hdG9taWNf
cHJvdChkLT5zcmNfcGFnZXNbc3JjX3BhZ2VdLAorCQkJCQkJIGQtPnNyY19wcm90KTsKIAkJCWlm
ICghZC0+c3JjX2FkZHIpCiAJCQkJcmV0dXJuIC1FTk9NRU07CiAKQEAgLTQ5OSw5ICs0OTksOSBA
QCBpbnQgdm13X2JvX2NwdV9ibGl0KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqZHN0LAogCX0K
IG91dDoKIAlpZiAoZC5zcmNfYWRkcikKLQkJdHRtX2t1bm1hcF9hdG9taWNfcHJvdChkLnNyY19h
ZGRyLCBkLnNyY19wcm90KTsKKwkJa3VubWFwX2F0b21pYyhkLnNyY19hZGRyKTsKIAlpZiAoZC5k
c3RfYWRkcikKLQkJdHRtX2t1bm1hcF9hdG9taWNfcHJvdChkLmRzdF9hZGRyLCBkLmRzdF9wcm90
KTsKKwkJa3VubWFwX2F0b21pYyhkLmRzdF9hZGRyKTsKIAogCXJldHVybiByZXQ7CiB9CmRpZmYg
LS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0
bV9ib19hcGkuaAppbmRleCAwYTlkMDQyZTA3NWEuLmRlMWNjZGNkNTcwMyAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaAorKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2Jv
X2FwaS5oCkBAIC02NjgsMTAgKzY2OCw2IEBAIGludCB0dG1fYm9fbW1hcF9vYmooc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWEsIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pOwogaW50IHR0
bV9ib19tbWFwKHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwK
IAkJc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYpOwogCi12b2lkICp0dG1fa21hcF9hdG9taWNf
cHJvdChzdHJ1Y3QgcGFnZSAqcGFnZSwgcGdwcm90X3QgcHJvdCk7Ci0KLXZvaWQgdHRtX2t1bm1h
cF9hdG9taWNfcHJvdCh2b2lkICphZGRyLCBwZ3Byb3RfdCBwcm90KTsKLQogLyoqCiAgKiB0dG1f
Ym9faW8KICAqCi0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
