Return-Path: <SRS0=xZI/=JE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F22E7C433B4
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 20:16:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38887611C9
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 20:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38887611C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V+wpC3ygb32GTKIu/cdWiA0w8lv7gs3eq9lE5Q2dk70=; b=HjpdoCdLd2A85X/g8y88wG39qX
	tkCH7XzUZeWcx5P28uiDFXUyElP5s3Fwa0sdwKp4oaXhltOfk7AUr56PYUZDAbmX0LZpSU0Q0j0Jv
	7l6QCstYpsRtEM6nprcry/kTwTK4HNV5BSckf8A6HpGVoFPmHAxNKfVqsmgfaSaf4ZlvxZzHwFQL2
	2uWb5qF1zuoTUi+FlcL8I8eAk0xxwScFgwzHwwZu53Z6/0njLUOLd92lx7afOe1aYCdjhQYfyUCAq
	oG85u/FmIxlCU1udNUflx+cgNQV/gWUBf7k598Qk5G2/iSYG2fpD0CID3aBX6gC3gpbdWZOLFutFA
	1v9U/S0Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUEax-005uyX-Do; Wed, 07 Apr 2021 20:16:11 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUEas-005uxY-Ky
 for linux-snps-arc@lists.infradead.org; Wed, 07 Apr 2021 20:16:09 +0000
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C7A63C0968;
 Wed,  7 Apr 2021 20:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1617826564; bh=7ioeylUPVK28eVlGLURTHYlnr+zjdQTXtQ2/41UkBj0=;
 h=From:To:CC:Subject:Date:From;
 b=UpTy+x7cu0pzUq1NCfwWw8V4WCS8CdEVmuQT7Fxz5wrfEsURokTBYa7BEZh35kjJM
 3YPu+6rWore4M7rmaU3TjC2zFdATlnm/OdHnpiaNOUPEu+GDMgvbCl6WtsPHSXOD5b
 GgjPQLGHaT3l0mo+ovx/MC/qQx+JA7VlCN5JutAN9VUNzCk/wzI6dqFpvook/KYpji
 4krN8C4rjcR0eF++8S1XbM4z4jxgflCMILPRepvuTMEiGOxjery9mFqu0ufrO4tIbj
 DJfVFamIHE3ydk+K3mptTyaBaaeH3AbG0V+IR8BPEp9jf08gmrln61W8aOdCHsc46P
 NZFdBKS2Wnt0w==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 8B1ECA0063;
 Wed,  7 Apr 2021 20:16:00 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id E3504801DD;
 Wed,  7 Apr 2021 20:15:57 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="CLw6o4xH";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpeLPbBfoA3f/jp+I1w2roEsChIMPEFMWEKfx8P7cUI1N3YAZ/9ZbJK8TJCyqDm5ulnlBaPnsv5o/Uruje+T5h6AJYfkJPwG7N/JgxZdeoAtfE7pc1owLtFYsuCRDxWBX7v6eundp5e4S3ButSGICIRM7FKpxI8dbnn5NYAaaiIiyopFI9klv+Mx/nFTvjFO31iwPX1s6NMhnwpAUdsUVinbRJj/96LsghTNxp430KZ9ISq60wePI9BlLxy5dXAfdh9CiRcAYf8XJnmFs0V+Lc5VuwnfAGhGX4DDfg5+QTEPSvHasPwaiF1pHGXnglCOQ+q65SHwRKE32uRt+2rB3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ioeylUPVK28eVlGLURTHYlnr+zjdQTXtQ2/41UkBj0=;
 b=Tz75uNU+cnjh09fBNYtgBlpV6a40W59jDStnrw2FQxSSV9sqWmmEl6zQW3O3Gp4N2oQ79awrKzKBZ8VYPJxGhQWJ7YaJ9hv+VFzN/EluEqYpakp3eV8jXqkTfth/q/iQhUu5JaMakLr2+jnbXpHc1yZiLf1+xQ+8KQRzHprimpKwiNxaHuHeFiziTc8DBWIM7DTSYbIsWi1f/Do63WN8QjOX6ovkaq7cTKaERcpDX+AKnEQn9SqhMzEjx5fz16IuA4eqST42adKfo8s8GsLKYk8VUguGzgnqNydE32vOlrG5YfVDwbz2CHYp8Y/apV4WKbVSTdbRIbG0udDSiIxP8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ioeylUPVK28eVlGLURTHYlnr+zjdQTXtQ2/41UkBj0=;
 b=CLw6o4xHlcPQXy+DRwMIKUmNRlehCeqQXBqebkwOAjnqrbt3+7vBnwBsoMqjihGvIvmZHmYbvVbNJyzX4PjhfMzmbe4rm1R877WB1u3VDunALsH1yyd0Q8IIVP5x3PYPSwr1du1qdA+tPcqcdyLEz6GpS9kQ6T2BtLY8KPja4UA=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3590.namprd12.prod.outlook.com (2603:10b6:a03:ae::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Wed, 7 Apr
 2021 20:15:54 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::88a:1041:81ed:982]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::88a:1041:81ed:982%7]) with mapi id 15.20.3999.033; Wed, 7 Apr 2021
 20:15:54 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: arcml <linux-snps-arc@lists.infradead.org>, lkml
 <linux-kernel@vger.kernel.org>, Wang Qing <wangqing@vivo.com>, dean.yang_cp
 <yangdianqing@yulong.com>
Subject: [GIT PULL] ARC fixes for 5.12-rc7
Thread-Topic: [GIT PULL] ARC fixes for 5.12-rc7
Thread-Index: AQHXK+rQnOfN/fm8gUiiw60dFIi/tQ==
Date: Wed, 7 Apr 2021 20:15:54 +0000
Message-ID: <2fd4c2ef-6a48-53db-1b22-3742e438ae23@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
authentication-results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a49f6787-ccc8-4867-056b-08d8fa01f2cb
x-ms-traffictypediagnostic: BYAPR12MB3590:
x-microsoft-antispam-prvs: <BYAPR12MB3590B13AC069AA35A22D8DF1B6759@BYAPR12MB3590.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vIQjuuL+lIiZo7XRpj6PffWId/A2SHPLy4fStB/h2qH7x/x4SHviLjdTx/Y0zvlYnaOYkXi2e9f4HJOGaQJXX+Rhmf5hfX4Cj69xb2fOw5ey9fuGiKEF7zpUDjxPhubVk1uNAYzQOda93fAO+EIY63aqfKXGm8IywPznEKYGqiPtHkaTORfJUveusEBctWoFysE4a0x/DvCaaVTcYclK2OKl5Ug3hyV339IIuobEO1BDQJJN6rI6XIMdDooM0SQkmo1PsQQ5cNkfPE5F2nw5BMY7dRh8oc44NjBwFrQGyM/fsSAUzhfn8n5eXJJkIOeRJpbngGaV+6zUOCAr0jYpthqrPJ9lt8tEZ/EO1XWM4W16Gu8E+h4/7bFMctyxQNFUWUPMiN6/U2frQkiTVmYzgp2V6AUs++vcU+9xTPlnNvCIrKerz+Lvul7T7BmPq/kvaBdy9ZFbrYc3u5JPkuRWCZF3cORvJBgW1bBoU/ZMxJjwbvbijQSK2Vjpai8bvQGkVQUSZtmhMfk5B0daCQNt8ksXXZmq6n0pJfUu5ttyYGy0DkEkR/XGATK+gKPp89LscMDLz25iFDAOT7FiMwUVxvOkui7NhykdQzcZt5YhZq6BHxT5sD4sHeJnW9b20vt9LfpqxEN21A95CdICS1obfWpLGK9/7rRz+8iM/l6ZVdCN+NX+ubAZiDKmtx4Q/WIHg0M+Jk1xGcf/m6T6b4JPepQ+ZkLrquDmEgDttAm/PlE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(366004)(376002)(396003)(136003)(38100700001)(83380400001)(316002)(71200400001)(186003)(6512007)(2906002)(8936002)(86362001)(478600001)(31686004)(4326008)(54906003)(6506007)(8676002)(2616005)(26005)(66446008)(66556008)(66476007)(5660300002)(66946007)(6486002)(64756008)(76116006)(36756003)(31696002)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Uml3TU5JcHpObXA2MXZ3WlNZS0Exa1g5UkE4M3NxVlQxQ1Z3T0ZjSm94Q1Ns?=
 =?utf-8?B?RkJ6RC9nNkhnZEFBS012MGN5NmVYYjNJVGFHUlJnSCtNVHRrdjhvdG52QVpE?=
 =?utf-8?B?ek0rTlBaNnNtVldiMjMrNnFuRHlqaGRrVkFqU2xUaGZUZU1tcmFhNVBISGpH?=
 =?utf-8?B?Q0p2b1UyclFseUExc01kb05JVys3cnZNYXZCUFlzTTNoVEtrWEpsRnFuSWQ4?=
 =?utf-8?B?OEVITkdwSEx6SWxmdG1jbVl4akhjZHZEb1hxVmJuYmc1dVEyaFNoQkdhSTVC?=
 =?utf-8?B?TGgwem9zdHc5NCtjS0lQN2UwQmd3S1o2S2craUxPSnFwV0lYTm5ObExpcDdF?=
 =?utf-8?B?SHpoOVZ6YkdTUC9YbmRmV2tlZHRORkJobHZGWUo0bzRJT0VTbmxHT2JHeDZH?=
 =?utf-8?B?MTZTTnBxd1I2RnFtMi9WM3JCL0ZlOGo4NE9na0w1V1A5NkZJMFBYd3YxQmQw?=
 =?utf-8?B?UXBpZUtwQzk2MTVMcHdHS0phK252cXllVTZ4RklNZzAveFlxS0R2amlBdmQ4?=
 =?utf-8?B?elQvNUQwUGhuNVhEMDlKZGYwTjdWbVJsM2R4TEZCbnJ4ZHFXZkVmS2N2TG9Z?=
 =?utf-8?B?aWdMMXR3VUZ3ZENsVkZEdXp0MWZ6TWZhaEc2cHhHMGY4RFA3ZUcxaDhHRndu?=
 =?utf-8?B?OG1tcGtJVFQxLzhweXhhTDd3OXdxRHIxeGFseEZtSlRCb2Y4ZE9KNndwdUZv?=
 =?utf-8?B?cis5OGh4TjIxN1V1MEZ3djE1dXpTQUJYdEFNY1VIUXpLa2FRUE9scEE5WFFj?=
 =?utf-8?B?bms5R2pkOXBXdzVkVlludTNsR0piVUh3aHhmUDNoUVA2enhLcUZNbUl2TVp0?=
 =?utf-8?B?V0JCb2xkZnNjWXgwV0R6RmNtN1VWMVlIc3Y0QmRxWmV6TEdPV1ZxSThWMGZk?=
 =?utf-8?B?SnZ1UFBCWnJHbFg1TTVQeFpyemxoc0dBNFBGdnhaQTdyUG9Bb3BhemducnZC?=
 =?utf-8?B?REJLNFpIQWhzWUFGQW1zTzFHNkZlUmtxNXNCdENoVGpSSWJOUmdTVERyV21G?=
 =?utf-8?B?Um1DZWRvUXkrbnR6SXAzTXBrRXR2WmJ2K1l1RVRialRaVnlZc3R0ZG1sYmdn?=
 =?utf-8?B?TFZXQUJML29iMHBqQjJ1eE1QNTNWQmpPTzJjaGdsY1AySnpIK2FQRFQzTFFo?=
 =?utf-8?B?N2xGWnE1UlpsOHlrUHd0eDF2ck5hSXVSQk5mTFgxL2ZIaExaNmtVcllMaHI0?=
 =?utf-8?B?YmxobDVOdEF5aU1QR1NZbXRuaTh4UlE4ckFCSGZLUXR5TE1vVjBnb1Zva1U1?=
 =?utf-8?B?a1o5ZlNZU2wxS2U0ZHFmRTZWUzJhNmNGaGRHRjVsRG5KVzNPendHRkF2aXcv?=
 =?utf-8?B?TDFNTTV1eEZyazZCUk9BNGlmT0V4ZUorRW51MFU3VjlSS3F3WnV6YkExVVc4?=
 =?utf-8?B?Q29mUU4zQy9naTAxSkZpc1NzbXlTSytmTW5XOUkvbGNEdTdCOHZwY3dPUmlL?=
 =?utf-8?B?N1RDWjRoZFlxM2ZzckNHUzYwUTU1V1dKSG42cnFCNndpaDF0TzVUbEc4UUN2?=
 =?utf-8?B?N2gxNE1kbmhjRVo4NTBwKzI1WFVOZlkwcnlNa0FJVUs5clFPM3hpY09IMDdL?=
 =?utf-8?B?cURYMzZVYXA2WkJnSDU2L3M0Y2RuMXNjZ0RoS1kxTmVIUExJK1hHYnlGU3E3?=
 =?utf-8?B?bFZ1VVpMZFUrYTE1cGJLZHZLajNoVlNZdit5ZEVUTUNnSDdYL3FRcHZ2NmtK?=
 =?utf-8?B?dWVUMTU4U1BlaVpabUxTTUVQL3hlWXdyNkVqSFFMcW9YYTIxcFE2dEM5QVcr?=
 =?utf-8?Q?bk9bcPw9yaL2wzO46Q=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <75AF744140F6154A9D7C2AFB508CBAC4@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a49f6787-ccc8-4867-056b-08d8fa01f2cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2021 20:15:54.7598 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K73i2J9rnUK+SwIptO8RovQvc3iZaV56cZFf7FWyljn1kn4+GXWjpNlJ/tHwTIXNDdcVdOswwTRRtlA6jRXfig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3590
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_211607_283721_5D201E4A 
X-CRM114-Status: GOOD (  11.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Linus,

Please pull a few straggler fixes for ARC for 5.12 !

Thx,
-Vineet
------------------>
The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:

   Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ 
tags/arc-5.12-rc7

for you to fetch changes up to 83520d62cc5a94d2ff0e2d37c8204fca13dd2637:

   ARC: treewide: avoid the pointer addition with NULL pointer 
(2021-03-22 10:05:43 -0700)

----------------------------------------------------------------
ARC fixlets for 5.12-rc7

----------------------------------------------------------------
Vineet Gupta (1):
       ARC: haps: bump memory to 1 GB

Wang Qing (1):
       arc: kernel: Return -EFAULT if copy_to_user() fails

dean.yang_cp (1):
       ARC: treewide: avoid the pointer addition with NULL pointer

  arch/arc/boot/dts/haps_hs.dts |  2 +-
  arch/arc/kernel/signal.c      |  4 ++--
  arch/arc/kernel/unwind.c      | 27 ++++++++++++++-------------
  3 files changed, 17 insertions(+), 16 deletions(-)
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
