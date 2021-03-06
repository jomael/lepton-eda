/* g_rc.c */
SCM scheme_directory(SCM s_path);

/* g_register.c */
void g_register_libgeda_funcs(void);
void g_register_libgeda_dirs (void);

/* m_hatch.c */
void m_hatch_polygon(GArray *points, gint angle, gint pitch, GArray *lines);

/* m_polygon.c */
gboolean m_polygon_interior_point(GArray *points, int x, int y);
double m_polygon_shortest_distance(GArray *points, int x, int y, gboolean closed);

/* o_attrib.c */
GList *o_read_attribs(TOPLEVEL *toplevel,
                      OBJECT *object_to_get_attribs,
                      TextBuffer *tb,
                      unsigned int release_ver,
                      unsigned int fileformat_ver, GError **err);
OBJECT *o_attrib_find_attrib_by_name (const GList *list, const char *name, int count);

/* geda_object.c */
void o_emit_pre_change_notify (OBJECT *object);
void o_emit_change_notify (OBJECT *object);

/* o_selection.c */
void o_selection_select (OBJECT *object);
void o_selection_unselect (OBJECT *object);

/* s_clib.c */
void s_clib_init (void);

/* s_conn.c */
CONN *s_conn_return_new(OBJECT *other_object, int type, int x, int y, int whichone, int other_whichone);
int s_conn_uniq(GList *conn_list, CONN *input_conn);
int s_conn_remove_other (OBJECT *other_object, OBJECT *to_remove);
OBJECT *s_conn_check_midpoint(OBJECT *o_current, int x, int y);
void s_conn_print(GList *conn_list);
void s_conn_add_object(PAGE *page, OBJECT *object);
void s_conn_remove_object(PAGE *page, OBJECT *object);

/* s_encoding.c */
gchar* s_encoding_base64_encode (gchar* src, guint srclen, guint* dstlenp, gboolean strict);
gchar* s_encoding_base64_decode (gchar* src, guint srclen, guint* dstlenp);

/* s_weakref.c */
GList *s_weakref_notify (void *dead_ptr, GList *weak_refs);
GList *s_weakref_add (GList *weak_refs, void (*notify_func)(void *, void *), void *user_data);
GList *s_weakref_remove (GList *weak_refs, void (*notify_func)(void *, void *), void *user_data);
GList *s_weakref_add_ptr (GList *weak_refs, void **weak_pointer_loc);
GList *s_weakref_remove_ptr (GList *weak_refs, void **weak_pointer_loc);
