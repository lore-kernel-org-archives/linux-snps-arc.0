Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F81CC021B0
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Feb 2025 09:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o5ieGCfJqpwaze8RzxQUfzsEZ8VvIwA+KH5O77UzRek=; b=0mKYvo4HlK+H+h
	qkOqcSbtu0Z/Uq5uGe5W/8Ij2vO9SUzzc3I+/Bq0y3SqtWDm+ywSQbaj3vvO+sZTFKtqx2WM9f5Ca
	cFgLTzoXM87PDkL3YvqFzxOv5rRvmPuQTQqAU9eiAkqiGFN89RSjCVK9Lj1gHXhB6nXtbxjIeqBXN
	lJVJlbvmoojtiLRJ9lLKGqQr96tiAM6XY9Hpi6qo5lV2M7GcJNtSr850HLeG57VXQoQ+VhehtnE5F
	jUTkh5a7hfiphobaqLXaExmqAopURS4ABtl+eLeQbNbHDRBdzPt570h4nevp0jI4EwS14DF9wXUiU
	gkGCiqr4tTZyt0ov+gOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgW9-0000000Buid-3MGY;
	Wed, 19 Feb 2025 09:37:21 +0000
Received: from mail.corporix.pl ([151.80.59.204])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgG7-0000000BoWc-0Th3
	for linux-snps-arc@lists.infradead.org;
	Wed, 19 Feb 2025 09:20:48 +0000
Received: by mail.corporix.pl (Postfix, from userid 1002)
	id F365625CE2; Wed, 19 Feb 2025 09:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=corporix.pl; s=mail;
	t=1739956266; bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=;
	h=Date:From:To:Subject:From;
	b=TCBALRQKn3jb4plDA5fLZb9r4kJCEmUXzO5yx1h7T2XadwbypmLC/sBcrw4Yfvhw3
	 E6wUwBL2X/pcpehQfsz1y65P7vcGV+F2zmHEuNS/9vJW++B0Q42cH7PFP5t1/LJwfn
	 48VVHAEvfFBPF3NhSMOSJSX3tjBxOn+UH5Xyj3RaeG+wCvmybjiN6Xh+R6XS1qVfdH
	 QAsytkvLy6IE7QFW/UL7sbkHoCnsXyUOPcD+7iCeAM3zZEoNShp5v2NYPNDYiIyLyJ
	 P8YCwwJtuv/mD2B0C7jeRxujZdYReXR+xFoB5oQwbfRWaj+JkNVUgn3k/2w8TzU6t3
	 5SI1AsPXLevCA==
Received: by mail.corporix.pl for <linux-snps-arc@lists.infradead.org>; Wed, 19 Feb 2025 09:10:43 GMT
Message-ID: <20250219074500-0.1.h.4fbn.0.cq7e44uh4m@corporix.pl>
Date: Wed, 19 Feb 2025 09:10:43 GMT
From: "Patryk Wysocki" <patryk.wysocki@corporix.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.corporix.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_012047_293109_04FB7185 
X-CRM114-Status: UNSURE (   1.50  )
X-CRM114-Notice: Please train this message.
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

RHppZcWEIGRvYnJ5LAoKUG96d29sacWCZW0gc29iaWUgbmEga29udGFrdCwgcG9uaWV3YcW8IGpl
c3RlbSB6YWludGVyZXNvd2FueSB3ZXJ5ZmlrYWNqxIUgbW/FvGxpd2/Fm2NpIG5hd2nEhXphbmlh
IHdzcMOzxYJwcmFjeS4KCldzcGllcmFteSBmaXJteSB3IHBvenlza2l3YW5pdSBub3d5Y2gga2xp
ZW50w7N3IGJpem5lc293eWNoLgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHIHcgY2VsdSBwcnpl
ZHN0YXdpZW5pYSBzemN6ZWfDs8WCb3d5Y2ggaW5mb3JtYWNqaT8gCgoKUG96ZHJhd2lhbQpQYXRy
eWsgV3lzb2NraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1zbnBzLWFyYwo=
