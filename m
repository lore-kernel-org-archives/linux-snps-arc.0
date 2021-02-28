Return-Path: <SRS0=dPsM=H6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA33C433E0
	for <linux-snps-arc@archiver.kernel.org>; Sun, 28 Feb 2021 17:05:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAAFA64DE3
	for <linux-snps-arc@archiver.kernel.org>; Sun, 28 Feb 2021 17:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAAFA64DE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vU5EOAAo+HIs6ufPYblu6xTHeteptMZK9iEmIZO8pPU=; b=cgSWaXhm8n5ffzI8sjhSgImWU
	nzj9aEebOty8hL+zNiC96JNwRt4qn/DCMZVjmz6jofJMgVROJK4JRuAPpsDuI63P/ikt1UHxS1wyt
	daGQCNBx7tIdb94aNlk2vPAfWMfwWdLfnC2E+WjLscYX98mjYcnZQ0u7iySkNtTo25B6dI32aYUoX
	mJkNMSNoB+uJrQIrgdQYYl2YDCvbj8vBabPlRXiOR7fhHN2dicnJd7uqIw/8ZHDZ05qE9/pjUV95D
	l0hgf6yCiiJde2DhWRuN82MDbHSWnQc+sFFvSOVM93P/ZK3z83fYrIaXyHMFCzgZjXzmiJUj5+6OD
	ZYUlAtWSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGPVQ-0001j5-93; Sun, 28 Feb 2021 17:05:20 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGPVN-0001id-Ji
 for linux-snps-arc@lists.infradead.org; Sun, 28 Feb 2021 17:05:18 +0000
Received: by mail-ej1-x633.google.com with SMTP id mm21so23500247ejb.12
 for <linux-snps-arc@lists.infradead.org>; Sun, 28 Feb 2021 09:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jk467Hk8sccWYhVzgEMkA6whGpvO2G5yv/mUzelQNJ8=;
 b=dJxzGlwQaY3FG9cJLl91luleu4NE9REZpE49mfL2CSPoHrnWKsyWfkjIk6P7nQGz6J
 a6jeIGuSKU1nKRM90aXIH7pyT5LscX2miGVARwYDVTSBe1w5aHHO0R/USdgyhOF2S++l
 wF+jZjtBXhYvz0Wk1FBlDbvmbLlyYAWxevTfkiUNB5XHk/lzeJDUQh+twRjLYndOjUj3
 LnJbzh3KkvEOs6V4QdfXuaWjpeN/R3oW36Rg4wvCN9SgfJzOdhcVM6qInLgge7ZxNYo/
 6+mR5px7rvGybwSKXXW9jBZgxVpeljEHnZHX07Rj4on8G5/wP3/hEU+Lg903GeGtM+5u
 84hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jk467Hk8sccWYhVzgEMkA6whGpvO2G5yv/mUzelQNJ8=;
 b=ua8A+H9ESPPuNnPbzRaVLmUlE3fP6JCFGIIZjTe1hZsOn/0JznGdVPZnCs5ysJPu8Q
 pnnEvYhVO1DHJ602EujsxQIAV0kASX8LrZxrq3cCmuevyp1A00M6v4VtsYh76ToFSoJN
 2Qs4vqsYYMzN6u6bZ0D3GFpCp3sw7tm4DTOd+RVLK0cBCou51WjNDp5zjzOM7CuZeilP
 3MdRi9Ur6XGapHoQ8miixK9Ft+iA0DeE+56qFBJTspUIMFnhIv4R8A1B10blacF7yp9U
 tizIuzzxkJ9KkAv2Pwi+MI2Ew54wdGoWKmKUy9vp6LqlDq37vPk1ZdEsolGZ2mKYT28O
 b0Cg==
X-Gm-Message-State: AOAM532fNrL7HCVMfqM54XAYR4+jE6psQPEv+Acs+iLCJYtB/QOzu6aC
 kJ2TJwiRyQNYtxVQB10AKftV5ZXKzdfy
X-Google-Smtp-Source: ABdhPJzVU2DokbFcUMZhcVBGnhUqfgbvKAMh1A0mklUt1I33IF96Oy7q8pgTBLMZKEdvjYEPMQbh4w==
X-Received: by 2002:a17:906:38d2:: with SMTP id
 r18mr5041707ejd.104.1614531916356; 
 Sun, 28 Feb 2021 09:05:16 -0800 (PST)
Received: from localhost.localdomain ([46.53.249.223])
 by smtp.gmail.com with ESMTPSA id 35sm11991890edp.85.2021.02.28.09.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 09:05:16 -0800 (PST)
Date: Sun, 28 Feb 2021 20:05:14 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: torvalds@linux-foundation.org
Subject: [PATCH 10/11] pragma once: delete few backslashes
Message-ID: <YDvNSg9OPv7JqfRS@localhost.localdomain>
References: <YDvLYzsGu+l1pQ2y@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YDvLYzsGu+l1pQ2y@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210228_120517_683220_227E9ABA 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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
Cc: Jason@zx2c4.com, mchehab@kernel.org, vgupta@synopsys.com, jiri@nvidia.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, idosch@nvidia.com,
 akpm@linux-foundation.org, linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From 251ca5673886b5bb0a42004944290b9d2b267a4a Mon Sep 17 00:00:00 2001
From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 19 Feb 2021 13:37:24 +0300
Subject: [PATCH 10/11] pragma once: delete few backslashes

Some macros contain one backslash too many and end up being the last
macro in a header file. When #pragma once conversion script truncates
the last #endif and whitespace before it, such backslash triggers
a warning about "OMG file ends up in a backslash-newline".

Needless to say I don't want to handle another case in my script,
so delete useless backslashes instead.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---
 arch/arc/include/asm/cacheflush.h          | 2 +-
 drivers/net/ethernet/mellanox/mlxsw/item.h | 2 +-
 include/linux/once.h                       | 2 +-
 include/media/drv-intf/exynos-fimc.h       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arc/include/asm/cacheflush.h b/arch/arc/include/asm/cacheflush.h
index e201b4b1655a..46704c341b17 100644
--- a/arch/arc/include/asm/cacheflush.h
+++ b/arch/arc/include/asm/cacheflush.h
@@ -112,6 +112,6 @@ do {									\
 } while (0)
 
 #define copy_from_user_page(vma, page, vaddr, dst, src, len)		\
-	memcpy(dst, src, len);						\
+	memcpy(dst, src, len)
 
 #endif
diff --git a/drivers/net/ethernet/mellanox/mlxsw/item.h b/drivers/net/ethernet/mellanox/mlxsw/item.h
index e92cadc98128..cc0133401dd1 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/item.h
+++ b/drivers/net/ethernet/mellanox/mlxsw/item.h
@@ -504,6 +504,6 @@ mlxsw_##_type##_##_cname##_##_iname##_set(char *buf, u16 index, u8 val)		\
 	return __mlxsw_item_bit_array_set(buf,					\
 					  &__ITEM_NAME(_type, _cname, _iname),	\
 					  index, val);				\
-}										\
+}
 
 #endif
diff --git a/include/linux/once.h b/include/linux/once.h
index 9225ee6d96c7..0af450ff94a5 100644
--- a/include/linux/once.h
+++ b/include/linux/once.h
@@ -55,6 +55,6 @@ void __do_once_done(bool *done, struct static_key_true *once_key,
 #define get_random_once(buf, nbytes)					     \
 	DO_ONCE(get_random_bytes, (buf), (nbytes))
 #define get_random_once_wait(buf, nbytes)                                    \
-	DO_ONCE(get_random_bytes_wait, (buf), (nbytes))                      \
+	DO_ONCE(get_random_bytes_wait, (buf), (nbytes))
 
 #endif /* _LINUX_ONCE_H */
diff --git a/include/media/drv-intf/exynos-fimc.h b/include/media/drv-intf/exynos-fimc.h
index 6b9ef631d6bb..6c5fbdacf4b5 100644
--- a/include/media/drv-intf/exynos-fimc.h
+++ b/include/media/drv-intf/exynos-fimc.h
@@ -152,6 +152,6 @@ static inline struct exynos_video_entity *vdev_to_exynos_video_entity(
 #define fimc_pipeline_call(ent, op, args...)				  \
 	((!(ent) || !(ent)->pipe) ? -ENOENT : \
 	(((ent)->pipe->ops && (ent)->pipe->ops->op) ? \
-	(ent)->pipe->ops->op(((ent)->pipe), ##args) : -ENOIOCTLCMD))	  \
+	(ent)->pipe->ops->op(((ent)->pipe), ##args) : -ENOIOCTLCMD))
 
 #endif /* S5P_FIMC_H_ */
-- 
2.29.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
